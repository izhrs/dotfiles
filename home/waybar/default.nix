{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        margin-top = 4;
        margin-left = 4;
        margin-right = 4;
        spacing = 5;

        modules-left = [ "custom/nix" "hyprland/workspaces" ];
        modules-center = [
          # "hyprland/window" 
          "clock"
        ];
        modules-right = [
          "cpu"
          "memory"
          "pulseaudio"
          "pulseaudio#microphone"
          "backlight"
          "bluetooth"
          "network"
          "battery"
          "tray"
          "custom/powermenu"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };

          # persistent-workspaces = { "*" = [ 1 2 3 4 5 6 7 8 9 ]; };
        };

        "custom/nix" = {
          format = "󱄅";
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
          format = " 󰥔  {:%H %M} ";
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
              "today" = "<span color='#f38ba8'><b>{}</b></span>"; # red on base
            };
          };
        };

        "cpu" = {
          format = "   {usage}%";
          tooltip = "false";
          on-click = "wezterm -e btm";
        };

        "memory" = {
          format = "   {}%";
          on-click = "wezterm -e btm";
        };

        "backlight" = {
          format = "{icon}{percent}% ";
          format-icons = [ " 󰃞  " " 󰃟  " " 󰃠  " ];
          on-scroll-down = "brightnessctl s +1%";
          on-scroll-up = "brightnessctl s 1%-";
          tooltip = false;
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
          format-icons = [ "   " "   " "   " "   " "   " ];
        };

        "bluetooth" = {
          format = "󰂯 Disconnected";
          format-connected = "󰂯 {device_alias}";
          format-off = "󰂲";
          format-disabled = "󰂲";
        };

        "network" = {
          format-wifi = " 󰖩  {essid} ";
          format-ethernet = " 󰈀 ";
          format-linked = " {ifname} (No IP) 󰈀 ";
          format-disconnected = " 󰖪  Disconnected";
          on-click = "wezterm -e nmtui";
          tooltip-format = "{essid} {signalStrength}%";
        };

        "pulseaudio" = {
          format = "{icon}{volume}% ";
          format-muted = " 󰖁 ";
          format-icons = { default = [ "   " "   " "   " ]; };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-down = "wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 1%+";
          on-scroll-up = "wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 1%-";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "  ";
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
          on-scroll-down =
            "wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SOURCE@ 1%+";
          on-scroll-up = "wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SOURCE@ 1%-";
        };

        "custom/wmname" = {
          format = " ";
          tooltip = "false";
          on-click = "$HOME/.config/rofi/launchers/type-1/launcher.sh";
          on-click-right = "$HOME/.config/hypr/Scripts/screenshot";
          on-click-middle = "$HOME/.config/hypr/Scripts/wallpaper-switch";
        };

        "custom/powermenu" = {
          format = "";
          on-click = "$HOME/.config/rofi/powermenu/powermenu.sh";
          tooltip = "false";
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}
