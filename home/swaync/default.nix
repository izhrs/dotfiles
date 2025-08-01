{
  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";
      cssPriority = "user";

      control-center-width = 420;
      control-center-height = 9999;
      control-center-margin-top = 2;
      control-center-margin-bottom = 2;
      control-center-margin-right = 1;
      control-center-margin-left = 0;

      notification-window-width = 400;
      notification-icon-size = 48;
      notification-body-image-height = 160;
      notification-body-image-width = 360;

      timeout = 4;
      timeout-low = 2;
      timeout-critical = 6;

      fit-to-screen = false;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 300;
      hide-on-clear = false;

      widgets = [
        "menubar"
        "volume"
        "backlight"
        "buttons-grid"
        "mpris"
        "inhibitors"
        "title"
        "notifications"
      ];

      widget-config = {

        backlight = {
          label = "󰞏";
          device = "intel_backlight";
          min = 10;
        };

        buttons-grid = {
          actions = [
            {
              label = " Wi-FI";
              command = "nm-connection-editor";
            }
            {
              label = "󰕾 Mute";
              command = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            }
            {
              label = "󰂯 Bluetooth";
              command = "blueman-manager";
            }
            {
              label = "  Theme";
              command = "/home/alien/.config/hypr/scripts/themechanging";
            }
          ];
        };

        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear";
        };

        menubar = {
          "menu#power-buttons" = {
            label = "";
            position = "left";
            actions = [
              {
                label = "   Reboot";
                command = "systemctl reboot";
              }
              {
                label = "   Lock";
                command = "swaylock.sh";
              }
              {
                label = "   Logout";
                command = "";
              }
              {
                label = "   Shut down";
                command = "systemctl poweroff";
              }
            ];
          };

          "menu#powermode-buttons" = {
            label = "󰠠";
            position = "right";
            actions = [
              {
                label = "Performance";
                command = "powerprofilesctl set performance";
              }
              {
                label = "Balanced";
                command = "powerprofilesctl set balanced";
              }
              {
                label = "Power-saver";
                command = "powerprofilesctl set power-saver";
              }
            ];
          };
        };
      };
    };

    style = builtins.readFile ./style.scss;
  };
}
