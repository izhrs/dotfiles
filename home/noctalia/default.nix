{ config, lib, ... }: {
  programs.noctalia = {
    enable = true;

    settings = {
      # for external monitors
      brightness.enable_ddcutil = true;

      theme = {
        mode = lib.mkForce config.stylix.polarity;
        source = "custom";
        custom_palette = "stylix";
      };

      wallpaper = {
        enabled = true;
        default.path = config.stylix.image;
        directory = ../../wallpapers;
        transition = [
          "disc"
          "honeycomb"
        ];
        automation.enabled = false;
      };

      bar.main = {
        background_opacity = config.stylix.opacity.desktop;
        shadow = false;
        radius = 12;
        margin_edge = 8;
        margin_ends = 8;
        thickness = 38;
        capsule_thickness = 0.76;

        start = [
          "launcher"
          "workspaces"
        ];
      };

      widget.clock.format = "{:%-I:%M}";

      shell = {
        corner_radius_scale = 1.0;
        button_borders = false;
        input_borders = false;
        popup_borders = false;
        popup_shadows = false;
        font_family = config.stylix.fonts.serif.name;
        lang = "en";
        time_format = "{:%-I:%M}";
        date_format = "%A, %x";
        offline_mode = false;
        external_ip_enabled = false;
        telemetry_enabled = false;
        setup_wizard_enabled = true;
        polkit_agent = true;
        password_style = "random";

        panel = {
          borders = false;
          shadow = false;
        };
      };

      dock = {
        enabled = true;
        position = "bottom";
        background_opacity = config.stylix.opacity.desktop;
        shadow = false;
        radius = 12;
        margin_edge = 8;
        smart_auto_hide = true;
        reserve_space = false;
        inactive_opacity = 1;

        pinned = [
          "kitty"
          "yazi"
          "org.gnome.Nautilus"
          "zen-beta"
          "thunderbird"
          "org.godotengine.Godot4.7"
          "gimp"
          "com.obsproject.Studio"
          "bottom"
          "virt-manager"
          "de.haeckerfelix.Fragments"
          "de.haeckerfelix.Shortwave"
          "com.rafaelmardojai.Blanket"
          "proton.vpn.app.gtk"
          "localsend_app"
          "com.heroicgameslauncher.hgl"
          "net.lutris.Lutris"
          "steam"
          "re.sonny.Tangram"
        ];
      };

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
    };
  };
}
