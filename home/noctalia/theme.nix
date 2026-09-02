{
  config,
  lib,
  pkgs,
}:
{
  mode = lib.mkForce config.stylix.polarity;
  source = lib.mkForce "wallpaper";
  wallpaper_scheme = "m3-tonal-spot";

  templates = {
    builtin_ids = [
      "gtk3"
      "gtk4"
      "helix"
      "niri"
      "qt"
      "wezterm"
    ];

    community_ids = [
      "bat"
      "discord"
      "pywalfox"
      "steam"
      "yazi"
      "zathura"
      "zed"
      "zellij"
    ];

    # closest-icon-theme script is in ./scripts.nix
    # requires installation of all the color varients and scheme varients
    # see ../../system/stylix.nix
    user.colloid_icon =
      let
        iconThemeScript = pkgs.writeShellScript "apply-icon-theme" ''

          accent_color="{{ colors.primary.default.hex }}"
          closest_theme=$(closest-icon-theme "$accent_color")
          dconf write /org/gnome/desktop/interface/icon-theme "'$closest_theme'"

          echo "icon theme updated"
        '';
      in
      {
        input_path = "${iconThemeScript}";
        output_path = "/tmp/noctalia/apply-icon-theme.sh";
        post_hook = "bash '/tmp/noctalia/apply-icon-theme.sh'";
      };
  };
}
