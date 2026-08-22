{ config, lib, ... }: {
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

        theme = {
          mode = lib.mkForce config.stylix.polarity;
          source = "custom";
          custom_palette = "stylix";
        };

        wallpaper = {
          # awww manages wallpaper
          enabled = false;
          default.path = config.stylix.image;
          last.path = config.stylix.image;
          directory = ../../wallpapers;
          transition = [
            "disc"
            "honeycomb"
          ];
          automation.enabled = false;
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

        lockscreen = {
          enabled = true;
          wallpaper = config.stylix.image;
        };

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
      };
  };
}
