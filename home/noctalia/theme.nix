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
      # "niri" # rolling my own for overview color
      "qt"
      "wezterm"
    ];

    community_ids = [
      "bat"
      "discord"
      "pywalfox-beta4"
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

    # this adds overview color
    user.niri =
      let
        niriTheme = pkgs.writeText "noctalia.kdl" ''
            layout {
              focus-ring {
                  active-color   "{{colors.primary.default.hex}}"
                  inactive-color "{{colors.surface.default.hex}}"
                  urgent-color   "{{colors.error.default.hex}}"
              }

              border {
                  active-color   "{{colors.primary.default.hex}}"
                  inactive-color "{{colors.surface.default.hex}}"
                  urgent-color   "{{colors.error.default.hex}}"
              }


              tab-indicator {
                  active-color   "{{colors.primary.default.hex}}"
                  inactive-color "{{colors.primary_container.default.hex}}"
                  urgent-color   "{{colors.error.default.hex}}"
              }

              insert-hint {
                  color "{{colors.primary.default.hex}}80"
              }
          }

          recent-windows {
              highlight {
                  active-color "{{colors.primary.default.hex}}"
                  urgent-color "{{colors.error.default.hex}}"
              }
          }

          overview {
            backdrop-color "{{colors.surface_variant.default.hex}}"
          }
        '';
      in
      {
        input_path = "${niriTheme}";
        output_path = "${config.xdg.configHome}/niri/noctalia.kdl";
      };
  };
}
