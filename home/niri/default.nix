{
  config,
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
        passes 1
        offset 2
        noise 0.02
        saturation 2
    }

    prefer-no-csd

    screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

    hotkey-overlay {
        skip-at-startup
    }

    workspace "1" { open-on-output "HDMI-A-2"; }
    workspace "2" { open-on-output "HDMI-A-2"; }
    workspace "3" { open-on-output "HDMI-A-2"; }
    workspace "gaming" { open-on-output "HDMI-A-2"; }
    workspace "5" { open-on-output "HDMI-A-2"; }

    binds {
        // Applications
        Mod+Return { spawn "kitty"; }
        Mod+B      { spawn "zen-beta"; }
        Mod+Slash      { spawn "rofi" "-show" "drun" "-show-icons"; }
        Mod+F      { spawn "kitty" "-e" "yazi"; }

        // Exit niri
        Mod+Shift+Q { quit; }
        Mod+Q { close-window; }
        Mod+Escape allow-inhibiting=false { spawn "lock"; }

        Mod+W repeat=false { toggle-overview; }
        Mod+Shift+F { fullscreen-window; }

        // Focus
        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }

        Mod+C { center-column; }
        Mod+Y       { toggle-window-floating; }
        Mod+Shift+Y { switch-focus-between-floating-and-tiling; }

        // Move
        Mod+Shift+H { move-column-left; }
        Mod+Shift+J { move-window-down; }
        Mod+Shift+K { move-window-up; }
        Mod+Shift+L { move-column-right; }

        Mod+Ctrl+J  { move-column-to-workspace-down; }
        Mod+Ctrl+K  { move-column-to-workspace-up; }

        // Resize
        Mod+Alt+H { set-column-width "-5%"; }
        Mod+Alt+J { set-window-height "+5%"; }
        Mod+Alt+K { set-window-height "-5%"; }
        Mod+Alt+L { set-column-width "+5%"; }

        // Workspaces
        Mod+1 { focus-workspace "1"; }
        Mod+2 { focus-workspace "2"; }
        Mod+3 { focus-workspace "3"; }
        Mod+4 { focus-workspace "gaming"; }
        Mod+5 { focus-workspace "5"; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace "gaming"; }
        Mod+0 { focus-workspace "5"; }

        Mod+Shift+1 { move-window-to-workspace "1"; }
        Mod+Shift+2 { move-window-to-workspace "2"; }
        Mod+Shift+3 { move-window-to-workspace "3"; }
        Mod+Shift+4 { move-window-to-workspace "gaming"; }
        Mod+Shift+5 { move-window-to-workspace "5"; }
        Mod+Shift+6 { move-window-to-workspace 6; }
        Mod+Shift+7 { move-window-to-workspace 7; }
        Mod+Shift+8 { move-window-to-workspace 8; }
        Mod+Shift+9 { move-window-to-workspace "gaming"; }
        Mod+Shift+0 { move-window-to-workspace "5"; }

        // Screenshot
        Print { screenshot show-pointer=false; }
        Mod+Print { screenshot-screen show-pointer=false; }

        // Audio & Brightness
        XF86AudioRaiseVolume { spawn-sh "noctalia msg volume-up"; }
        XF86AudioLowerVolume { spawn-sh "noctalia msg volume-down"; }
        XF86AudioMute { spawn-sh "noctalia msg volume-mute"; }
        XF86MonBrightnessUp { spawn-sh "noctalia msg brightness-up"; }
        XF86MonBrightnessDown { spawn-sh "noctalia msg brightness-down"; }

        // scroll
        Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollUp   cooldown-ms=150 { focus-workspace-up; }
        Mod+WheelScrollRight                { focus-column-right; }
        Mod+WheelScrollLeft                 { focus-column-left; }
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
        match app-id="^zen-beta$"

        background-effect {
            blur true
        }

        max-width 1900
        draw-border-with-background false
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

    window-rule {
        match app-id="^steam$"
        match app-id="^heroic$"
        match app-id="^net.lutris.Lutris$"

        open-on-workspace "gaming"
    }

    window-rule {
        match app-id="^localsend_app$"
        open-floating true
        default-column-width { fixed 400; }
        default-window-height { fixed 800; }

        opacity ${toString config.stylix.opacity.applications}
        background-effect { blur true; }
        draw-border-with-background false
    }
  '';
}
