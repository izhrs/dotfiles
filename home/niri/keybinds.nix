{
  # Applications
  "Mod+Return" = {
    spawn = "kitty";
  };
  "Mod+B" = {
    spawn = "zen-beta";
  };
  "Mod+Space" = {
    spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "launcher"
    ];
  };
  "Mod+Slash" = {
    spawn = [
      "noctalia"
      "msg"
      "panel-toggle"
      "launcher"
      "/emo "
    ];
  };
  "Mod+F" = {
    spawn = [
      "kitty"
      "-e"
      "yazi"
    ];
  };

  # Exit niri
  "Mod+Shift+Q" = {
    quit = { };
  };
  "Mod+Q" = {
    close-window = { };
  };
  "Mod+Escape" = {
    _props = {
      allow-inhibiting = false;
    };
    spawn = [
      "noctalia"
      "msg"
      "session"
      "lock"
    ];
  };
  "Mod+W" = {
    _props = {
      repeat = false;
    };
    toggle-overview = { };
  };
  "Mod+Shift+F" = {
    fullscreen-window = { };
  };

  # Focus
  "Mod+H" = {
    focus-column-left = { };
  };
  "Mod+J" = {
    focus-window-down = { };
  };
  "Mod+K" = {
    focus-window-up = { };
  };
  "Mod+L" = {
    focus-column-right = { };
  };
  "Mod+C" = {
    center-column = { };
  };
  "Mod+Y" = {
    toggle-window-floating = { };
  };
  "Mod+Shift+Y" = {
    switch-focus-between-floating-and-tiling = { };
  };

  # Move
  "Mod+Shift+H" = {
    move-column-left = { };
  };
  "Mod+Shift+J" = {
    move-window-down = { };
  };
  "Mod+Shift+K" = {
    move-window-up = { };
  };
  "Mod+Shift+L" = {
    move-column-right = { };
  };
  "Mod+Ctrl+J" = {
    move-column-to-workspace-down = { };
  };
  "Mod+Ctrl+K" = {
    move-column-to-workspace-up = { };
  };

  # Resize
  "Mod+Alt+H" = {
    set-column-width = "-5%";
  };
  "Mod+Alt+J" = {
    set-window-height = "+5%";
  };
  "Mod+Alt+K" = {
    set-window-height = "-5%";
  };
  "Mod+Alt+L" = {
    set-column-width = "+5%";
  };

  # Workspaces
  "Mod+1" = {
    focus-workspace = "1";
  };
  "Mod+2" = {
    focus-workspace = "2";
  };
  "Mod+3" = {
    focus-workspace = "3";
  };
  "Mod+4" = {
    focus-workspace = "gaming";
  };
  "Mod+5" = {
    focus-workspace = "5";
  };
  "Mod+6" = {
    focus-workspace = 6;
  };
  "Mod+7" = {
    focus-workspace = 7;
  };
  "Mod+8" = {
    focus-workspace = 8;
  };
  "Mod+9" = {
    focus-workspace = "gaming";
  };
  "Mod+0" = {
    focus-workspace = "5";
  };

  "Mod+Shift+1" = {
    move-window-to-workspace = "1";
  };
  "Mod+Shift+2" = {
    move-window-to-workspace = "2";
  };
  "Mod+Shift+3" = {
    move-window-to-workspace = "3";
  };
  "Mod+Shift+4" = {
    move-window-to-workspace = "gaming";
  };
  "Mod+Shift+5" = {
    move-window-to-workspace = "5";
  };
  "Mod+Shift+6" = {
    move-window-to-workspace = 6;
  };
  "Mod+Shift+7" = {
    move-window-to-workspace = 7;
  };
  "Mod+Shift+8" = {
    move-window-to-workspace = 8;
  };
  "Mod+Shift+9" = {
    move-window-to-workspace = "gaming";
  };
  "Mod+Shift+0" = {
    move-window-to-workspace = "5";
  };

  # Screenshot
  "Print" = {
    screenshot = {
      _props = {
        show-pointer = false;
      };
    };
  };
  "Mod+Print" = {
    screenshot-screen = {
      _props = {
        show-pointer = false;
      };
    };
  };

  # Audio & Brightness
  "XF86AudioRaiseVolume" = {
    spawn-sh = "noctalia msg volume-up";
  };
  "XF86AudioLowerVolume" = {
    spawn-sh = "noctalia msg volume-down";
  };
  "XF86AudioMute" = {
    spawn-sh = "noctalia msg volume-mute";
  };
  "XF86MonBrightnessUp" = {
    spawn-sh = "noctalia msg brightness-up";
  };
  "XF86MonBrightnessDown" = {
    spawn-sh = "noctalia msg brightness-down";
  };

  # Scroll
  "Mod+WheelScrollDown" = {
    _props = {
      cooldown-ms = 150;
    };
    focus-workspace-down = { };
  };
  "Mod+WheelScrollUp" = {
    _props = {
      cooldown-ms = 150;
    };
    focus-workspace-up = { };
  };
  "Mod+WheelScrollRight" = {
    focus-column-right = { };
  };
  "Mod+WheelScrollLeft" = {
    focus-column-left = { };
  };
}
