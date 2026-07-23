{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.file.".config/niri/config.kdl".text = ''
    spawn-at-startup "noctalia"
    input {
        keyboard {
            xkb {
                layout ""
                model ""
                rules ""
                variant ""
            }

            repeat-delay 600
            repeat-rate 25
            track-layout "global"
        }

        touchpad {
            tap
            natural-scroll
        }
    }

    output "HDMI-A-2" {
        mode "1920x1080@189.998000"
        position x=0 y=0
        scale 1.0
        transform "normal"
    }

    cursor {
        xcursor-theme "default"
        xcursor-size 24
    }

    layout {
        gaps 8

        struts {
            left 0
            right 0
            top 0
            bottom 0
        }

        default-column-width
        center-focused-column "never"

        focus-ring {
            off
        }

        border {
            width 2
            active-color "${config.lib.stylix.colors.withHashtag.base07}"
            inactive-color "${config.lib.stylix.colors.withHashtag.base03}"
        }
    }

    overview {
        backdrop-color "${config.lib.stylix.colors.withHashtag.base00}"
    }

    blur {
        // Default values with custom tweaks.
        passes 2
        offset 2
        noise 0.02
        saturation 2
    }

    prefer-no-csd

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    binds {
        // Applications
        Mod+Return { spawn "kitty"; }
        Mod+A      { spawn "drawer"; }
        Mod+B      { spawn "firefox"; }
        Mod+D      { spawn "rofi" "-show" "drun" "-show-icons"; }
        Mod+F      { spawn "kitty" "-e" "yazi"; }

        // Window management
        Mod+Q { close-window; }

        // Focus
        Mod+H { focus-column-left; }
        Mod+J { focus-workspace-down; }
        Mod+K { focus-workspace-up; }
        Mod+L { focus-column-right; }

        // Move
        Mod+Shift+H { move-column-left; }
        Mod+Shift+J { move-workspace-down; }
        Mod+Shift+K { move-workspace-up; }
        Mod+Shift+L { move-column-right; }

        // Resize
        Mod+Alt+H { set-column-width "-10%"; }
        Mod+Alt+J { set-window-height "+10%"; }
        Mod+Alt+K { set-window-height "-10%"; }
        Mod+Alt+L { set-column-width "+10%"; }

        // Workspaces
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }

        Mod+Shift+1 { move-window-to-workspace 1; }
        Mod+Shift+2 { move-window-to-workspace 2; }
        Mod+Shift+3 { move-window-to-workspace 3; }
        Mod+Shift+4 { move-window-to-workspace 4; }
        Mod+Shift+5 { move-window-to-workspace 5; }
        Mod+Shift+6 { move-window-to-workspace 6; }
        Mod+Shift+7 { move-window-to-workspace 7; }
        Mod+Shift+8 { move-window-to-workspace 8; }
        Mod+Shift+9 { move-window-to-workspace 9; }

        // Screenshot
        Print {
            screenshot show-pointer=false
        }

        // Audio & Brightness
        XF86AudioRaiseVolume { spawn-sh "noctalia msg volume-up"; }
        XF86AudioLowerVolume { spawn-sh "noctalia msg volume-down"; }
        XF86AudioMute { spawn-sh "noctalia msg volume-mute"; }
        XF86MonBrightnessUp { spawn-sh "noctalia msg brightness-up"; }
        XF86MonBrightnessDown { spawn-sh "noctalia msg brightness-down"; }
    }

    window-rule {
        geometry-corner-radius 12
        clip-to-geometry true
    }

    window-rule {
        match app-id="^kitty$"
        match app-id="^org.pwmt.zathura$"

        background-effect {
            blur true
        }

        draw-border-with-background false
    }

    window-rule {
        match app-id="^firefox$"

        background-effect {
            blur true
        }

        max-width 1900
    }

    window-rule {
      match app-id="dev.noctalia.Noctalia"
      open-floating true
      default-column-width { fixed 1080; }
      default-window-height { fixed 920; }
    }

    switch-events {
        lid-close { spawn "noctalia" "msg" "session" "lock-and-suspend"; }
    }


    layer-rule {
        match namespace="rofi"

        background-effect {
            blur true
            xray false
        }
    }
  '';
}
