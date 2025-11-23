{ pkgs, ... }: {

  home.packages = with pkgs; [
    wl-clipboard

    (writeShellScriptBin "autostart" ''
      # Waybar (if enabled)
      pkill waybar
      waybar -c $HOME/.config/waybar/config -s $HOME/.config/waybar/style.css &

      # Wallpaper
      swww kill
      swww init
      swww restore
    '')

    (writeShellScriptBin "code-dir" ''
      export EDITOR='hx'
      if [[ -d ~/Documents/code ]]; 
        then wezterm -e yazi ~/Documents/code; 
      else 
        wezterm -e ~/.local/bin/mnt -o docs;
        wezterm -e yazi ~/Documents/code; 
      fi
    '')
  ];

  services.swww.enable = true;
  programs.hyprshot = {
    enable = true;
    saveLocation = "$HOME/Pictures/Screenshots";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      exec-once = [ "autostart" ];

      monitor = [
        "eDP-1, 1920x1080@144, 0x0, 1"
        "HDMI-A-2, 1920x1080@180, 0x0, 1, mirror, eDP-1"
      ];

      xwayland.force_zero_scaling = true;

      general = {
        layout = "master";
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "$lavender";
        "col.inactive_border" = "$overlay0";

        allow_tearing = true;
        resize_on_border = true;
      };

      misc = {
        # hyprchan
        # force_default_wallpaper = 2;
        # focus new windows that want to be focused
        focus_on_activate = true;
      };

      decoration = {
        rounding = 4;
        blur = {
          enabled = true;
          brightness = 1.0;
          new_optimizations = true;
          ignore_opacity = true;
          contrast = 1.05;
          noise = 2.0e-3;

          vibrancy = 5.0e-2;
          vibrancy_darkness = 0.1;

          passes = 1;
          size = 5;

          popups = true;
          popups_ignorealpha = 0.2;
        };

        shadow.enabled = false;
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

      windowrule = [
        "opacity 0.95, class:^(firefox)$"
        "opacity 0.95, class:^(thunderbird)$"

        "opacity 0.8, class:^(org.pwmt.zathura)$"
        "opacity 0.8, class:^(inlyne)$"
        "opacity 0.8, class:^(.protonvpn-app-wrapped)$"
        "opacity 0.8, class:^(.virt-manager-wrapped)$"

        "float, class:^(.protonvpn-app-wrapped)$"
      ];

      layerrule = [
        "blur, waybar"
        "blur, nwg-drawer"
        "blur, rofi"
        "blur, swaync-control-center"
        "blur, swaync-notification-window"
      ];

      bind = [
        # compositor commands
        "$mod SHIFT, R, exec, hyprctl reload"
        "$mod, Q, killactive,"
        "$mod SHIFT, E, exec, pkill Hyprland"

        "$mod ALT, Return, fullscreen,"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating,"

        "$mod CTRL, left, movecurrentworkspacetomonitor, l"
        "$mod CTRL, right, movecurrentworkspacetomonitor, r"

        # move focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
        "$mod, left, movefocus, l"
        "$mod, down, movefocus, d"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"

        # move focus
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, down, movewindow, d"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, right, movewindow, r"

        #run important programs
        "$mod, Return, exec, wezterm"
        "$mod, b, exec, firefox"
        "$mod, slash, exec, rofi -show drun -show-icons"
        "$mod SHIFT, slash, exec, rofi -show emoji"
        "$mod, a, exec, drawer" # defined in nwg-drawer

        # notification 
        "$mod, n, exec, swaync-client -t -sw"

        #screenshot
        ",PRINT, exec, hyprshot -m output"
        "$mod, PRINT, exec, hyprshot -m window"
        "$mod SHIFT, PRINT, exec, hyprshot -m region"

        "$mod, Space, exec, code-dir"
        "$mod, f, exec, wezterm -e yazi"
      ]

        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]) 10));

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

        ", xf86monbrightnessdown,exec, brightnessctl set 5%-"
        ", xf86monbrightnessup,exec, brightnessctl set 5%+"

        # resize active window
        "$mod ALT, H,resizeactive, -20 0"
        "$mod ALT, L,resizeactive, 20 0"
        "$mod ALT, J,resizeactive, 0 20"
        "$mod ALT, K,resizeactive, 0 -20"
      ];

      input = {
        kb_layout = "us";

        # focus change on cursor move
        follow_mouse = 2;
        # force_no_accel = 1;
        # accel_profile = "flat";
        touchpad = { natural_scroll = 1; };
      };

      # Catppuccin mocha color scheme
      "$rosewater" = "rgb(f5e0dc)";
      "$rosewaterAlpha" = "f5e0dc";

      "$flamingo" = "rgb(f2cdcd)";
      "$flamingoAlpha" = "f2cdcd";

      "$pink" = "rgb(f5c2e7)";
      "$pinkAlpha" = "f5c2e7";

      "$mauve" = "rgb(cba6f7)";
      "$mauveAlpha" = "cba6f7";

      "$red" = "rgb(f38ba8)";
      "$redAlpha" = "f38ba8";

      "$maroon" = "rgb(eba0ac)";
      "$maroonAlpha" = "eba0ac";

      "$peach" = "rgb(fab387)";
      "$peachAlpha" = "fab387";

      "$yellow" = "rgb(f9e2af)";
      "$yellowAlpha" = "f9e2af";

      "$green" = "rgb(a6e3a1)";
      "$greenAlpha" = "a6e3a1";

      "$teal" = "rgb(94e2d5)";
      "$tealAlpha" = "94e2d5";

      "$sky" = "rgb(89dceb)";
      "$skyAlpha" = "89dceb";

      "$sapphire" = "rgb(74c7ec)";
      "$sapphireAlpha" = "74c7ec";

      "$blue" = "rgb(89b4fa)";
      "$blueAlpha" = "89b4fa";

      "$lavender" = "rgb(b4befe)";
      "$lavenderAlpha" = "b4befe";

      "$text" = "rgb(cdd6f4)";
      "$textAlpha" = "cdd6f4";

      "$subtext1" = "rgb(bac2de)";
      "$subtext1Alpha" = "bac2de";

      "$subtext0" = "rgb(a6adc8)";
      "$subtext0Alpha" = "a6adc8";

      "$overlay2" = "rgb(9399b2)";
      "$overlay2Alpha" = "9399b2";

      "$overlay1" = "rgb(7f849c)";
      "$overlay1Alpha" = "7f849c";

      "$overlay0" = "rgb(6c7086)";
      "$overlay0Alpha" = "6c7086";

      "$surface2" = "rgb(585b70)";
      "$surface2Alpha" = "585b70";

      "$surface1" = "rgb(45475a)";
      "$surface1Alpha" = "45475a";

      "$surface0" = "rgb(313244)";
      "$surface0Alpha" = "313244";

      "$base" = "rgb(1e1e2e)";
      "$baseAlpha" = "1e1e2e";

      "$mantle" = "rgb(181825)";
      "$mantleAlpha" = "181825";

      "$crust" = "rgb(11111b)";
      "$crustAlpha" = "11111b";
    };
  };
}
