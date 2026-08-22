{ config }: {
  main_bar = {
    background_opacity = config.stylix.opacity.desktop;
    margin_edge = 8;
    margin_ends = 8;
    padding = 8;
    radius = 12;
    shadow = false;
    thickness = 38;

    dead_zone.actions = {
      left = "panel-toggle control-center home";
      right = "panel-toggle control-center system";
    };

    start = [ "workspaces" ];
    end = [
      "recorder"
      "clipboard"
      "notifications"
      "group:io" # IO
      "group:conn" # connectivity
      "group:power" # display brightness and power
      "tray"
    ];

    capsule_thickness = 0.76;
    capsule_group = [
      {
        accordion = false;
        accordion_direction = "end";
        enabled = true;
        fill = "surface_variant";
        id = "conn";
        members = [
          "network"
          "bluetooth"
        ];
        opacity = 1.0;
        padding = 6.0;
      }
      {
        accordion = false;
        accordion_direction = "end";
        enabled = true;
        fill = "surface_variant";
        id = "power";
        members = [
          "brightness"
          "battery"
        ];
        opacity = 1.0;
        padding = 6.0;
      }
      {
        accordion = false;
        accordion_direction = "end";
        enabled = true;
        fill = "surface_variant";
        id = "io";
        members = [
          "volume"
          "input_volume"
        ];
        opacity = 1.0;
        padding = 6.0;
      }
    ];
  };

  widget = {
    clipboard.capsule = true;

    clock = {
      font_weight = 600;
      format = "{:%-I:%M}";
    };

    media.capsule = true;

    notifications.capsule = true;

    recorder = {
      capsule = true;
      type = "noctalia/screen_recorder:recorder";
    };

    session.capsule = true;

    tray.capsule = true;

    volume.capsule = true;

    workspaces = {
      active_pill_size = 2.5;
      empty_color = "on_surface_variant";
      labels_only_when_occupied = true;
      occupied_color = "primary";
      pill_scale = 0.8;
      show_labels = false;
    };
  };
}
