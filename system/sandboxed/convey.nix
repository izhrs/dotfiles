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

  convey-sandboxed = mkNixPak {
    config =
      { sloth, ... }:
      let
        appId = "net.donnybeelo.Convey";
        appDir = sloth.concat' sloth.homeDir "/.var/nixpak/${appId}";
        sub = p: sloth.concat' appDir p;
      in
      {
        app.package = pkgs.convey;

        flatpak.appId = appId;

        dbus.enable = true;
        dbus.policies = {
          "${appId}" = "own";
          "${appId}.*" = "own";

          "org.freedesktop.DBus" = "talk";
          "ca.desrt.dconf" = "talk";
          "org.freedesktop.Notifications" = "talk";
          "org.freedesktop.portal.Desktop" = "talk";
          "org.freedesktop.portal.FileChooser" = "talk";
          "org.freedesktop.portal.OpenURI" = "talk";
          "org.gnome.Contacts" = "talk";
          "org.gnome.evolution.dataserver.*" = "talk";
          "org.gnome.Settings" = "talk";
          "org.freedesktop.secrets" = "talk";
        };

        bubblewrap = {
          network = true;

          env = {
            XDG_CONFIG_HOME = sub "/config";
            XDG_DATA_HOME = sub "/data";
            XDG_CACHE_HOME = sub "/cache";
            XDG_STATE_HOME = sub "/.local/state";

            XDG_DATA_DIRS = "${config.stylix.icons.package}/share:/usr/share";
          };

          bind.rw = [
            (sloth.mkdir (sub "/config"))
            (sloth.mkdir (sub "/data"))
            (sloth.mkdir (sub "/cache"))
            (sloth.mkdir (sub "/.local/state"))
          ];

          bind.ro = [
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
    convey-sandboxed.config.env
  ];
}
