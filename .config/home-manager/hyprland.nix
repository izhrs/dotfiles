{ pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      general = {
        layout = "hy3";
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";

        allow_tearing = true;
        resize_on_border = true;
      };

      misc = {
        # hyprchan
        force_default_wallpaper = 2;
        # focus new windows that want to be focused
        focus_on_activate = true;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 1.0e-2;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };

        shadow = {
          enabled = true;
          range = 100;
          render_power = 2;
          ignore_window = true;
          color = "rgba(00000055)";
          offset = "0 15";
          scale = 0.97;
        };
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };

      bind = [
        # compositor commands
        "$mod SHIFT, R, exec, hyprctl reload"
        "$mod, Q, killactive,"
        "$mod SHIFT, E, exec, pkill Hyprland"

        "$mod, F, fullscreen,"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating,"
        "$mod ALT, ,resizeactive,"

        "$mod CTRL, left, movecurrentworkspacetomonitor, l"
        "$mod CTRL, right, movecurrentworkspacetomonitor, r"

        # move focus
        "$mod, h, hy3:movefocus, l"
        "$mod, j, hy3:movefocus, d"
        "$mod, k, hy3:movefocus, u"
        "$mod, l, hy3:movefocus, r"
        "$mod, left, hy3:movefocus, l"
        "$mod, down, hy3:movefocus, d"
        "$mod, up, hy3:movefocus, u"
        "$mod, right, hy3:movefocus, r"

        # move focus
        "$mod SHIFT, h, hy3:movewindow, l, once"
        "$mod SHIFT, j, hy3:movewindow, d, once"
        "$mod SHIFT, k, hy3:movewindow, u, once"
        "$mod SHIFT, l, hy3:movewindow, r, once"
        "$mod SHIFT, left, hy3:movewindow, l, once"
        "$mod SHIFT, down, hy3:movewindow, d, once"
        "$mod SHIFT, up, hy3:movewindow, u, once"
        "$mod SHIFT, right, hy3:movewindow, r, once"

        #run important programs
        "$mod, Return, exec, kitty"
        "$mod, D, exec, rofi -show drun"
        # "$mod, D, exec, rofi -show combi"

        #screenshot
        ", Print, exec, grimblast copy area"
      ]

        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, hy3:movetoworkspace, ${
                toString ws
              }"
            ]) 9));

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bindl = [
        # volume
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      bindle = [
        # volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ];

      input = {
        kb_layout = "us";

        # focus change on cursor move
        follow_mouse = 2;
        # force_no_accel = 1;
        # accel_profile = "flat";
      };

      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        XDG_SESSION_TYPE = "wayland";

        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
      };
    };
  };
}
