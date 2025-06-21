{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        modules-left = [ "custom/arch" "hyprland/workspaces" ];
        modules-center = [
          # "hyprland/window" 
          "clock"
        ];
        modules-right =
          [ "pulseaudio" "network" "battery" "tray" "custom/powermenu" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
        };

        "custom/arch" = {
          format = " 󱄅 ";
          tooltip = false;
          on-click-release = "bemenu-run";
        };

        "custom/media" = {
          "format" = " {}";
          "max-lenght" = "40";
          "interval" = "1";
          "exec" = "playerctl metadata --format '{{ artist }} - {{ title }}'";
          "on-click" = "playerctl play-pause";
          "on-click-right" = "playerctl stop";
          "smooth-scrolling-threshold" = "4";
          "on-scroll-up" = "playerctl next";
          "on-scroll-down" = "playerctl previous";
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        "tray" = {
          spacing = "10";
          icon-size = "13";
        };

        "clock" = {
          format = " 󰥔 {:%H %M} ";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';

          "calendar" = {
            "mode" = "month";
            "format" = {
              "months" = "<span color='#f5e0dc'><b>{}</b></span>"; # rosewater
              "days" = "<span color='#cdd6f4'><b>{}</b></span>"; # flamingo
              "weeks" = "<span color='#cdd6f4'><b>W{}</b></span>"; # teal
              "weekdays" = "<span color='#9999CC'><b>{}</b></span>"; # yellow
              "today" =
                "<span background='#f38ba8' color='#0f0f16'><b>{}</b></span>"; # red on base
            };
          };
        };

        "cpu" = {
          format = " {usage}%";
          tooltip = "false";
        };

        "memory" = {
          format = " {}%";
          on-click = "kitty -e btm";
        };

        "backlight" = {
          format = "{icon}{percent}%";
          format-icons = [ " 󰃞 " " 󰃟 " " 󰃠 " ];
          on-scroll-up = "light -A 1";
          on-scroll-down = "light -U 1";
        };

        "battery" = {
          states = {
            warning = "30";
            critical = "15";
          };
          format = "{icon}{capacity}% ";
          tooltip-format = "{timeTo} {capacity}%";
          format-charging = "󰂄 {capacity}% ";
          format-plugged = " ";
          format-alt = "{time} {icon}";
          format-icons = [ " " " " " " " " " " ];
        };

        "network" = {
          format-wifi = " 󰖩 {essid} ";
          format-ethernet = " 󰈀 ";
          format-linked = " {ifname} (No IP) 󰈀 ";
          format-disconnected = " 󰖪  Disconnected";
          on-click = "kitty -e nmtui";
          tooltip-format = "{essid} {signalStrength}%";
        };

        "pulseaudio" = {
          format = " {icon} ";
          format-muted = " 󰖁 ";
          format-icons = { default = [ "  " "  " "  " ]; };
          on-click = "pavucontrol &";
        };

        "custom/wmname" = {
          format = " ";
          tooltip = "false";
          on-click = "$HOME/.config/rofi/launchers/type-1/launcher.sh";
          on-click-right = "$HOME/.config/hypr/Scripts/screenshot";
          on-click-middle = "$HOME/.config/hypr/Scripts/wallpaper-switch";
        };

        "custom/powermenu" = {
          format = "    ";
          on-click = "$HOME/.config/rofi/powermenu/powermenu.sh";
        };
      };
    };
    style = ''
      * {
          font-family: JetBrainsMono Nerd Font Mono;
          font-weight: normal;
          font-size: 15px;
          min-height: 0;
          color: #cdd6f4;
      }


      tooltip {
          font-size: 14px;
          color: #cdd6f4;
          background-color: #0f0f16;
          border: 2px solid #9999CC;
          border-radius: 10px;
      }

      #window,
      #clock,
      #tray,
      #pulseaudio,
      #battery,
      #network,
      #workspaces,
      #custom-powermenu,
      #custom-arch {
          background-color: #0f0f16;
          margin-top: 10px;
          margin-left: 0px;
          margin-right: 0px;
          margin-bottom: 0px;
          padding: 3px;
      }

      #tray {
          border: 2px solid #9999CC;
          padding-left: 10px;
          padding-right: 10px;
          margin-left: 5px;
      }

      #custom-arch,
      #window {
          border: 2px solid #9999CC;
          border-radius: 10px 10px 10px 10px;
      }

      #custom-spotify {
          margin-left: 5px;
          border: 2px solid #9999CC;
          border-radius: 10px 10px 10px 10px;
      }

      #workspaces {
          border: 2px solid #9999CC;
          color: #eeeeef;
          padding-left: 5px;
          padding-right: 5px;
      }

      #clock {
          border: 2px solid #9999CC;
          border-radius: 10px;
          font-weight: bold;
      }

      #custom-powermenu {
          border: 2px solid #f38ba8;
          color: #f38ba8;
          border-radius: 10px;
          margin-right: 10px;
          margin-left: 3px;
      }

      #network {
          border-left: 2px solid #9999CC;
          border-top: 2px solid #9999CC;
          border-bottom: 2px solid #9999CC;
      }

      #battery {
          border-top: 2px solid #9999CC;
          border-bottom: 2px solid #9999CC;
          border-right: 2px solid #9999CC;
          border-radius: 0px 10px 10px 0px;
      }

      #pulseaudio {
          border: 2px solid #9999CC;
          border-radius: 10px;
          margin-right: 5px;
      }

      #tray {
          border-radius: 10px 10px 10px 10px;
          margin-right: 3px;
      }

      #network {
          border-radius: 10px 0px 0px 10px;
      }

      #custom-arch {
          font-size: 16px;
          margin-right: 5px;
          margin-left: 10px;
      }

      #window {
          font-weight: bold;
          border-radius: 10px 10px 10px 10px;
          padding-left: 7px;
          padding-right: 7px;
      }

      #workspaces button {
          color: #eeeeef;
          padding: 1px;
      }

      #workspaces button.active {
          color: white;
      }

      #workspaces button.focused {
          color: white;
      }

      #workspaces {
          border-radius: 10px 10px 10px 10px;
      }

      button {
          min-width: 16px;
      }

      window#waybar {
          /* you can also GTK3 CSS functions! */
          background-color: transparent;
          border-radius: 10px 10px 10px 10px;
      }
    '';
  };
}
