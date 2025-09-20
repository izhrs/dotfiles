{ pkgs, lib, ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 3600;
          on-timeout = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
        }

        {
          timeout = 3600;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
  systemd.user.services.hypridle.Unit.After =
    lib.mkForce "graphical-session.target";
}
