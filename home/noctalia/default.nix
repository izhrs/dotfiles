{ config, lib, ... }: {
  programs.noctalia = {
    enable = true;

    settings = {
      theme = {
        mode = lib.mkForce "auto";
        source = "custom";
        custom_pallete = "stylix";
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

      shell = {
        corner_radius_scale = 1.0;
        button_borders = false;
        input_borders = false;
        popup_borders = false;
        popup_shadows = false;
        font_family = config.stylix.fonts.serif.name;
        lang = "en";
        time_format = "{:%H:%M}";
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
          "firefox"
          "thunderbird"
          "org.godotengine.Godot4.7"
          "gimp"
          "com.obsproject.Studio"
          "bottom"
          "virt-manager"
          "org.qbittorrent.qBittorrent"
          "proton.vpn.app.gtk"
          "com.heroicgameslauncher.hgl"
          "net.lutris.Lutris"
          "steam"
        ];
      };
    };
  };
}
