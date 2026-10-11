{
  config,
  pkgs,
  inputs,
  ...
}:
let
  mkNixPak = inputs.nixpak.lib.nixpak {
    inherit (pkgs) lib;
    inherit pkgs;
  };

  newsflash-sandboxed = mkNixPak {
    config =
      { sloth, ... }:
      let
        appId = "io.gitlab.news_flash.NewsFlash";
        appDir = sloth.concat' sloth.homeDir "/.var/nixpak/${appId}";
        sub = p: sloth.concat' appDir p;

        # whithout this images wont work
        # glycin picks Flatpak mode when it sees nixpak's fake /.flatpak-info and then
        # calls flatpak-spawn, which doesn't exist in the sandbox, so no image loader
        # starts. This stand-in drops the flags and runs the loader directly.
        fakeFlatpakSpawn = pkgs.writeShellScript "flatpak-spawn" ''
          export PATH=${pkgs.util-linux}/bin:$PATH
          while [ $# -gt 0 ]; do
            case "$1" in
              --) shift; break ;;
              -*) shift ;;
              *) break ;;
            esac
          done
          exec "$@"
        '';
      in
      {
        app.package = pkgs.newsflash;

        flatpak.appId = appId;

        dbus.enable = true;
        dbus.policies = {
          "${appId}" = "own";
          "${appId}.*" = "own";
          "org.mpris.MediaPlayer2.Newsflash" = "own";

          "org.freedesktop.DBus" = "talk";
          "org.freedesktop.Notifications" = "talk";
          "org.freedesktop.portal.Desktop" = "talk";
        };

        bubblewrap = {
          network = true;

          env = {
            XDG_CONFIG_HOME = sub "/config";
            XDG_DATA_HOME = sub "/data";
            XDG_CACHE_HOME = sub "/cache";
            XDG_STATE_HOME = sub "/.local/state";

            XDG_DATA_DIRS = "${config.stylix.icons.package}/share:${pkgs.shared-mime-info}/share:/usr/share";

            CLAPPER_ENHANCERS_PATH = "${pkgs.clapper-enhancers}/lib/clapper-enhancers";

            FONTCONFIG_FILE = "${pkgs.makeFontsConf {
              fontDirectories = [
                config.stylix.fonts.sansSerif.package
                config.stylix.fonts.monospace.package
                config.stylix.fonts.emoji.package
              ];
            }}";
          };

          bind.rw = [
            (sloth.mkdir (sub "/config"))
            (sloth.mkdir (sub "/data"))
            (sloth.mkdir (sub "/cache"))
            (sloth.mkdir (sub "/.local/state"))

            # OPML import/export through the file chooser
            [
              (sloth.concat' (sloth.env "XDG_RUNTIME_DIR") "/doc/by-app/${appId}")
              (sloth.concat' (sloth.env "XDG_RUNTIME_DIR") "/doc")
            ]

            (sloth.concat' (sloth.env "XDG_RUNTIME_DIR") "/pipewire-0")
            (sloth.concat' (sloth.env "XDG_RUNTIME_DIR") "/pulse/native")
          ];

          bind.ro = [
            [
              "${fakeFlatpakSpawn}"
              "/usr/bin/flatpak-spawn"
            ]
            [
              "${pkgs.cacert}/etc/ssl/certs"
              "/etc/ssl/certs"
            ]
            [
              (sloth.concat' sloth.homeDir "/.config/gtk-4.0")
              (sub "/config/gtk-4.0")
            ]
          ];

          bind.dev = [
            "/dev/dri"
          ];
        };
      };
  };
in
{
  environment.systemPackages = [
    newsflash-sandboxed.config.env
  ];
}
