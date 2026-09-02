{ config, ... }:
{
  imports = [ ./scripts.nix ];

  wayland.windowManager.niri =
    let
      # defined here so I can change this in one place instead of at every occurrence
      primaryDisplay = "HDMI-A-2";
      # primaryDisplay = "eDP-1";
    in
    {
      enable = true;
      checkConfig = false;

      extraConfigEarly = ''
        include "${config.xdg.configHome}/niri/noctalia.kdl"
      '';

      settings = {
        spawn-sh-at-startup = "setup-noctalia";
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
          _args = [ primaryDisplay ];
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
              _args = [ "work" ];
              open-on-output = primaryDisplay;
            };
          }
          {
            workspace = {
              _args = [ "system" ];
              open-on-output = primaryDisplay;
            };
          }
          {
            workspace = {
              _args = [ "communication" ];
              open-on-output = primaryDisplay;
            };
          }
          {
            workspace = {
              _args = [ "gaming" ];
              open-on-output = primaryDisplay;
            };
          }
          {
            workspace = {
              _args = [ "misc" ];
              open-on-output = primaryDisplay;
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
            # global window rules
            window-rule = {
              geometry-corner-radius = 12;
              clip-to-geometry = true;

              _children = [
                { background-effect.blur = true; }
                { draw-border-with-background = false; }
              ];
            };
          }

          {
            window-rule._children = [
              {
                match._props.app-id = "^(org\.localsend\.localsend_app|proton\.vpn\.app\.gtk|de\.haeckerfelix\.Fragments|de\.haeckerfelix\.Shortwave|io\.bassi\.Amberol|io\.gitlab\.adhami3310\.Impression)$";
              }
              { open-floating = true; }
              { default-column-width.fixed = 400; }
              { default-window-height.fixed = 700; }
            ];
          }

          {
            # forced opacity
            window-rule._children = [
              {
                match._props.app-id = "^(inlyne|org\.localsend\.localsend_app)$";
              }
              { opacity = config.stylix.opacity.applications; }
            ];
          }

          {
            window-rule._children = [
              {
                match._props.app-id = "^(dev\.noctalia\.Noctalia|io\.github\.kolunmi\.Bazaar|com\.github\.tchx84\.Flatseal)$";
              }
              { open-on-workspace = "system"; }
            ];
          }

          {
            window-rule._children = [
              {
                match._props.app-id = "^(re\.sonny\.Tangram|vesktop|org\.gnome\.Evolution|me\.proton\.Mail)$";
              }
              { block-out-from = "screen-capture"; }
              { open-on-workspace = "communication"; }
            ];
          }

          {
            window-rule._children = [
              {
                match._props.app-id = "^(steam|org\.gnome\.Chess|org\.gnome\.Sudoku|heroic|net\.lutris\.Lutris)$";
              }
              { open-on-workspace = "gaming"; }
            ];
          }
        ];
      };
    };
}
