{ config, lib, ... }:

let
  # toKDL can't represent two sibling keys with the same node name
  # (e.g. multiple top-level `workspace` or `window-rule` nodes), because
  # its input is a plain Nix attrset. This works around that: render each
  # {name; value;} pair as its own toKDL call, then concatenate the text.
  renderRepeated =
    entries:
    lib.concatMapStringsSep "\n" (e: lib.hm.generators.toKDL { } { ${e.name} = e.value; }) entries;
in
{
  home.file.".config/niri/config.kdl".text = lib.concatStringsSep "\n" [

    ''include "~/.config/niri/noctalia.kdl"''

    (lib.hm.generators.toKDL { } {
      "spawn-sh-at-startup" =
        "cat ~/.config/noctalia/config.toml > ~/.local/state/noctalia/settings.toml";
      "spawn-at-startup" = "noctalia";

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

      "prefer-no-csd" = { };

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
        focus-ring = {
          width = 2;
          # off = { };
        };
        border = {
          off = { };
          # width = 2;
          # active-color = config.lib.stylix.colors.withHashtag.base07; # lavender
          # inactive-color = config.lib.stylix.colors.withHashtag.base03;
          # urgent-color = config.lib.stylix.colors.withHashtag.base08; # red
        };
      };

      overview = {
        backdrop-color = config.lib.stylix.colors.withHashtag.base00;
      };

      blur = {
        passes = 2;
        offset = 2;
        noise = 0.02;
        saturation = 2;
      };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      hotkey-overlay = {
        skip-at-startup = { };
      };

      binds = import ./keybinds.nix { inherit config; };

      switch-events = { };
    })

    (renderRepeated [
      {
        name = "workspace";
        value = {
          _args = [ "1" ];
          open-on-output = "HDMI-A-2";
        };
      }
      {
        name = "workspace";
        value = {
          _args = [ "2" ];
          open-on-output = "HDMI-A-2";
        };
      }
      {
        name = "workspace";
        value = {
          _args = [ "3" ];
          open-on-output = "HDMI-A-2";
        };
      }
      {
        name = "workspace";
        value = {
          _args = [ "gaming" ];
          open-on-output = "HDMI-A-2";
        };
      }
      {
        name = "workspace";
        value = {
          _args = [ "5" ];
          open-on-output = "HDMI-A-2";
        };
      }
    ])

    (renderRepeated [
      {
        name = "layer-rule";
        value = {
          _children = [
            {
              match = {
                _props = {
                  namespace = "^noctalia-(bar-[^\"]+|notification|panel|attached-panel|osd)$";
                };
              };
            }

          ];
          background-effect = {
            xray = false;
          };
        };
      }
    ])

    # window-rules
    (renderRepeated [
      {
        name = "window-rule";
        value = {
          geometry-corner-radius = 12;
          clip-to-geometry = true;
        };
      }
      {
        name = "window-rule";
        value = {
          _children = [
            {
              match = {
                _props = {
                  app-id = "^kitty$";
                };
              };
            }
            {
              match = {
                _props = {
                  app-id = "^org.pwmt.zathura$";
                };
              };
            }
          ];
          background-effect = {
            blur = true;
          };
          draw-border-with-background = false;
        };
      }
      {
        name = "window-rule";
        value = {
          _children = [
            {
              match = {
                _props = {
                  app-id = "^firefox$";
                };
              };
            }
            {
              match = {
                _props = {
                  app-id = "^zen-beta$";
                };
              };
            }
          ];
          background-effect = {
            blur = true;
          };
          max-width = 1904;
          draw-border-with-background = false;
        };
      }
      {
        name = "window-rule";
        value = {
          match = {
            _props = {
              app-id = "dev.noctalia.Noctalia";
            };
          };
          open-floating = true;
          default-column-width = {
            fixed = 1080;
          };
          default-window-height = {
            fixed = 920;
          };
        };
      }
      {
        name = "window-rule";
        value = {
          _children = [
            {
              match = {
                _props = {
                  app-id = "^steam$";
                };
              };
            }
            {
              match = {
                _props = {
                  app-id = "^heroic$";
                };
              };
            }
            {
              match = {
                _props = {
                  app-id = "^net.lutris.Lutris$";
                };
              };
            }
          ];
          open-on-workspace = "gaming";
        };
      }
      {
        name = "window-rule";
        value = {
          match = {
            _props = {
              app-id = "^(localsend_app|proton\.vpn\.app\.gtk|de\.haeckerfelix\.Fragments|de\.haeckerfelix\.Shortwave|com\.rafaelmardojai\.Blanket)$";
            };
          };
          open-floating = true;
          default-column-width = {
            fixed = 400;
          };
          default-window-height = {
            fixed = 700;
          };
          opacity = config.stylix.opacity.applications;
          background-effect = {
            blur = true;
          };
          draw-border-with-background = false;
        };
      }
      {
        name = "window-rule";
        value = {
          _children = [
            {
              match = {
                _props = {
                  app-id = "^inlyne$";
                };
              };
            }
          ];
          opacity = config.stylix.opacity.applications;
          background-effect = {
            blur = true;
          };
          draw-border-with-background = false;
        };
      }
      {
        name = "window-rule";
        value = {
          _children = [
            {
              match = {
                _props = {
                  app-id = "^re\.sonny\.Tangram$";
                };
              };
            }
          ];
          block-out-from = "screen-capture";
        };
      }
    ])
  ];
}
