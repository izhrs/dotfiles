{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        margin-top = 8;
        margin-left = 8;
        margin-right = 8;
        spacing = 4;

        modules-left = [ "custom/arch" "hyprland/workspaces" ];
        modules-center = [
          # "hyprland/window" 
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "tray"
          "custom/powermenu"
        ];

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
              "weekdays" = "<span color='#b4befe'><b>{}</b></span>"; # yellow
              "today" =
                "<span background-color='#f38ba8' color='#0f0f16'><b>{}</b></span>"; # red on base
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
          format = "{icon}{percent}% ";
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
          format-charging = " 󰂄 {capacity}% ";
          format-plugged = "  ";
          format-alt = " {time} {icon}";
          format-icons = [ "  " "  " "  " "  " "  " ];
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
          format = "{icon}{volume}% ";
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
          background-color: alpha(#0f0f16, 0.85);
          border: 2px solid #b4befe;
          border-radius: 11px;
      }

      #window,
      #backlight,
      #clock,
      #tray,
      #pulseaudio,
      #battery,
      #network,
      #workspaces,
      #custom-powermenu,
      #custom-arch {
          background-color: alpha(#0f0f16, 0);
          padding: 2px 5px;
          border-radius: 8px;
          border: 2px solid alpha(#b4befe, 1);
      }

      #tray {
          padding-left: 15px;
          padding-right: 15px;
      }

      #workspaces {
          color: #eeeeef;
          padding-left: 10px;
          padding-right: 10px;
      }

      #clock {
          font-weight: bold;
      }

      #custom-powermenu {
          border: 2px solid alpha(#f38ba8, 1);
          color: #f38ba8;
          margin-right: 5px;
      }

      #custom-arch {
          margin-left: 5px;
      }

      #window {
          font-weight: bold;
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

      button {
          min-width: 16px;
      }

      window#waybar {
          background-color: alpha(#0f0f16, 0.85);
          color: #cdd6f4;
          border-radius: 11px;
          border: 0px solid alpha(#b4befe, 0.5);
      }
    '';
  };
}
