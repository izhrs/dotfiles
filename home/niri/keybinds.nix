# this is inspired by COSMIC keybinds.
{ config, ... }: {
  # Applications
  "Mod+Return" = {
    spawn = "kitty";
  };
  "Mod+B" = {
    spawn = "firefox";
  };
  "Mod+Space" = {
    spawn-sh = "noctalia msg panel-toggle launcher";
  };
  "Mod+Slash" = {
    spawn-sh = "noctalia msg panel-toggle launcher /emo";
  };
  # Mod+F is Niri's default for maximize-column
  # I'm using Mod+M for that
  "Mod+F" = {
    spawn-sh = "kitty -e yazi";
  };

  # Default: Mod+Shift+E; Exit niri
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
    spawn-sh = "noctalia msg session lock";
  };

  # default: Mod+Escape; here that is use for locking session
  "Mod+Shift+Escape" = {
    toggle-keyboard-shortcuts-inhibit = { };
  };

  # default: Mod+O; workspace overview on COSMIC,
  "Mod+W" = {
    _props = {
      repeat = false;
    };
    toggle-overview = { };
  };
  # default: Mod+Shift+F; full screen on COSMIC
  "Mod+F12" = {
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

  # default: Mod+V; this is derived from COSMIC
  "Mod+Y" = {
    toggle-window-floating = { };
  };
  "Mod+Shift+Y" = {
    switch-focus-between-floating-and-tiling = { };
  };

  # default: Mod+W; COSMIC's stacking mode
  "Mod+S" = {
    toggle-column-tabbed-display = { };
  };

  # COSMIC move motions, sadly consume-or-expel-window does not work on floating windows
  "Mod+Shift+H" = {
    consume-or-expel-window-left = { };
  };
  "Mod+Shift+L" = {
    consume-or-expel-window-right = { };
  };
  "Mod+Shift+J" = {
    move-window-down = { };
  };
  "Mod+Shift+K" = {
    move-window-up = { };
  };
  "Mod+Ctrl+J" = {
    move-column-to-workspace-down = { };
  };
  "Mod+Ctrl+K" = {
    move-column-to-workspace-up = { };
  };

  "Mod+BracketLeft" = {
    move-column-left = { };
  };
  "Mod+BracketRight" = {
    move-column-right = { };
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

  "Mod+R" = {
    switch-preset-column-width = { };
  };
  # Default: Mod+F; here Mod+F is used for launching file manager
  "Mod+M" = {
    maximize-column = { };
  };

  # Workspaces
  # I hate syntax of nix loops/map
  "Mod+1" = {
    focus-workspace = 1;
  };
  "Mod+2" = {
    focus-workspace = 2;
  };
  "Mod+3" = {
    focus-workspace = 3;
  };
  "Mod+4" = {
    focus-workspace = 4;
  };
  "Mod+5" = {
    focus-workspace = 5;
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
    focus-workspace = 4;
  };
  "Mod+0" = {
    focus-workspace = 5;
  };

  "Mod+Shift+1" = {
    move-window-to-workspace = 1;
  };
  "Mod+Shift+2" = {
    move-window-to-workspace = 2;
  };
  "Mod+Shift+3" = {
    move-window-to-workspace = 3;
  };
  "Mod+Shift+4" = {
    move-window-to-workspace = 4;
  };
  "Mod+Shift+5" = {
    move-window-to-workspace = 5;
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
    move-window-to-workspace = 4;
  };
  "Mod+Shift+0" = {
    move-window-to-workspace = 5;
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
  "Mod+Alt+Print" = {
    screenshot-window = {
      _props = {
        show-pointer = false;
      };
    };
  };

  # Audio & Brightness
  "XF86AudioRaiseVolume" = {
    _props = {
      allow-when-locked = true;
    };
    spawn-sh = "noctalia msg volume-up";
  };
  "XF86AudioLowerVolume" = {
    _props = {
      allow-when-locked = true;
    };
    spawn-sh = "noctalia msg volume-down";
  };
  "XF86AudioMute" = {
    spawn-sh = "noctalia msg volume-mute";
  };
  "XF86MonBrightnessUp" = {
    _props = {
      allow-when-locked = true;
    };
    spawn-sh = "noctalia msg brightness-up";
  };
  "XF86MonBrightnessDown" = {
    _props = {
      allow-when-locked = true;
    };
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
