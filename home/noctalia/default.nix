{
  config,
  lib,
  pkgs,
  ...
}:
{
  stylix.targets.gtk.colors.enable = false;
  stylix.targets.qt.colors.enable = false;
  # stylix.icons.enable = false;

  # this is required for noctalia to theme gtk3 applications
  # stylix does it automatically
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  programs.noctalia = {
    enable = true;

    settings =
      let
        outputs = [
          "HDMI-A-2"
          "eDP-1"
        ];
        bar = import ./bar.nix { inherit config; };
      in
      {

        bar.main = bar.main_bar;
        widget = bar.widget;
        dock = import ./dock.nix { inherit config; };
        shell = import ./shell.nix { inherit config; };

        wallpaper = import ./wallpaper.nix { inherit config; };
        theme = import ./theme.nix { inherit config lib; };

        audio = {
          # volume over 100%
          enable_overdrive = true;
          # play sound effects for shell events
          enable_sounds = true;
        };

        # for external monitors
        brightness = {
          enable_ddcutil = true;
          minimum_brightness = 0.01;
        };

        # show events from online calendar accounts
        calendar.enabled = true;

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
        lockscreen_widgets = {
          enabled = true;
          schema_version = 2;
          widget_order = map (o: "lockscreen-login-box@${o}") outputs;

          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };

          # I hate this syntax
          widget = lib.listToAttrs (
            map (o: {
              name = "lockscreen-login-box@${o}";
              value = import ./lockscreen-login-box.nix {
                inherit config;
                output = o;
              };
            }) outputs
          );
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

        hooks = {
          colors_changed = [ "pkill -USR1 hx" ];
        };
      };
  };
}
