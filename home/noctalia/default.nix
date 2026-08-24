{ config, lib, ... }: {
  stylix.targets.gtk.colors.enable = false;
  stylix.targets.qt.colors.enable = false;
  # stylix.icons.enable = false;

  programs.noctalia = {
    enable = true;

    settings =
      let
        bar = import ./bar.nix { inherit config; };
      in
      {

        bar.main = bar.main_bar;
        widget = bar.widget;
        dock = import ./dock.nix { inherit config; };
        shell = import ./shell.nix { inherit config; };

        wallpaper = import ./wallpaper.nix { inherit config; };

        theme = {
          mode = lib.mkForce config.stylix.polarity;
          custom_pallete = "stylix";
          source = lib.mkForce "wallpaper";
          wallpaper_scheme = "m3-tonal-spot";

          templates = {
            builtin_ids = [
              "gtk3"
              "gtk4"
              "helix"
              "kitty"
              "niri"
              "qt"
              "starship"
              "wezterm"
            ];

            community_ids = [
              "bat"
              "gimp"
              "heroiclauncher"
              "lazygit"
              "libreoffice"
              "papirus-icons"
              "pywalfox"
              "steam"
              "yazi"
              "zathura"
              "zed"
              "zellij"
            ];
          };
        };

        # for external monitors
        brightness.enable_ddcutil = true;

        keybinds = {
          left = [
            "left"
            "alt+h"
          ];
          right = [
            "right"
            "alt+l"
          ];
          up = [
            "alt+k"
            "shift+tab"
            "iso_left_tab"
          ];
          down = [
            "alt+j"
            "tab"
          ];

          tab_next = [ "down" ];
          tab_previous = [ "up" ];
        };

        lockscreen.enabled = true;

        plugins = {
          enabled = [ "noctalia/screen_recorder" ];
          auto_update = "none";

          source = {
            name = "noctalia/screen_recorder";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            enabled = true;
          };
        };

        hooks = {
          colors_changed = [ "pkill -USR1 hx" ];
        };
      };
  };
}
