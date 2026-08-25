{ config, ... }:
{
  wayland.windowManager.niri = {
    enable = true;
    checkConfig = false;

    extraConfigEarly = ''
      include "${config.xdg.configHome}/niri/noctalia.kdl"
    '';

    settings = {
      spawn-sh-at-startup = "cat ~/.config/noctalia/config.toml > ~/.local/state/noctalia/settings.toml";
      spawn-at-startup = "noctalia";

      prefer-no-csd = { };

      binds = import ./keybinds.nix;
      hotkey-overlay.skip-at-startup = { };

      switch-events = { };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      input = {
        keyboard = {
          xkb = {
            layout = "";
            model = "";
            rules = "";
            variant = "";
          };
          repeat-delay = 600;
          repeat-rate = 25;
          track-layout = "global";
        };
        touchpad = {
          tap = { };
          natural-scroll = { };
        };
      };

      output = {
        _args = [ "HDMI-A-2" ];
        mode = "1920x1080@179.998";
        position = {
          _props = {
            x = 0;
            y = 0;
          };
        };
        scale = 1.0;
        transform = "normal";
      };

      cursor = {
        xcursor-theme = config.stylix.cursor.name;
        xcursor-size = config.stylix.cursor.size;
      };

      layout = {
        gaps = 8;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
        default-column-width = { };
        center-focused-column = "never";

        focus-ring.width = 2;
        border.off = { };
      };

      blur = {
        passes = 2;
        offset = 2;
        noise = 0.02;
        saturation = 2;
      };

      # repeated/parameterized top-level nodes
      _children = [
        # workspaces
        {
          workspace = {
            _args = [ "1" ];
            open-on-output = "HDMI-A-2";
          };
        }
        {
          workspace = {
            _args = [ "2" ];
            open-on-output = "HDMI-A-2";
          };
        }
        {
          workspace = {
            _args = [ "3" ];
            open-on-output = "HDMI-A-2";
          };
        }
        {
          workspace = {
            _args = [ "gaming" ];
            open-on-output = "HDMI-A-2";
          };
        }
        {
          workspace = {
            _args = [ "5" ];
            open-on-output = "HDMI-A-2";
          };
        }

        # layer-rule
        {
          layer-rule._children = [
            {
              match._props.namespace = "^noctalia-(bar-[^\"]+|notification|panel|attached-panel|osd)$";
            }
            { background-effect.xray = false; }
          ];
        }

        # window-rules
        {
          window-rule = {
            geometry-corner-radius = 12;
            clip-to-geometry = true;
          };
        }

        {
          window-rule._children = [
            {
              match._props.app-id = "^(kitty|org\.pwmt\.zathura)$";
            }
            { background-effect.blur = true; }
            { draw-border-with-background = false; }
          ];
        }

        {
          window-rule._children = [
            {
              match._props.app-id = "^(firefox|zen-beta)$";
            }
            { background-effect.blur = true; }
            { max-width = 1904; }
            { draw-border-with-background = false; }
          ];
        }

        {
          window-rule._children = [
            {
              match._props.app-id = "dev.noctalia.Noctalia";
            }
            { open-floating = true; }
            { default-column-width.fixed = 1080; }
            { default-window-height.fixed = 920; }
          ];
        }

        {
          window-rule._children = [
            {
              match._props.app-id = "^(steam|heroic|net\.lutris\.Lutris)$";
            }
            { open-on-workspace = "gaming"; }
          ];
        }

        {
          window-rule._children = [
            {
              match._props = {
                app-id = "^(localsend_app|proton\.vpn\.app\.gtk|de\.haeckerfelix\.Fragments|de\.haeckerfelix\.Shortwave|com\.rafaelmardojai\.Blanket)$";
              };
            }
            { open-floating = true; }
            { default-column-width.fixed = 400; }
            { default-window-height.fixed = 700; }
            { opacity = config.stylix.opacity.applications; }
            { background-effect.blur = true; }
            { draw-border-with-background = false; }
          ];
        }

        {
          window-rule._children = [
            {
              match._props = {
                app-id = "^inlyne$";
              };
            }
            { opacity = config.stylix.opacity.applications; }
            { background-effect.blur = true; }
            { draw-border-with-background = false; }
          ];
        }

        {
          window-rule._children = [
            {
              match._props.app-id = "re.sonny.Tangram";
            }
            { block-out-from = "screen-capture"; }
          ];
        }
      ];
    };
  };
}
