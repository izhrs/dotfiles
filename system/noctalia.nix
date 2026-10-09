{ config, pkgs, ... }:
{
  programs = {
    niri.enable = true;

    noctalia.enable = true;
    # it enables power-profiles-daemon which conflicts with tlp
    noctalia.recommendedServices.enable = false;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    cursorTheme.package = config.stylix.cursor.package;
    passwordlessSyncUsers = [ "izhrs" ];

    settings = {
      session.default = "niri";

      appearance = {
        font_family = config.stylix.fonts.serif.name;
        theme_mode = config.stylix.polarity;
        hide_logo = true;
        password_style = "random";
        scheme = "Synced";
        corner_radius_scale = 1.0;

        wallpaper = {
          fill_mode = "crop";
          path = config.stylix.image;
        };

        palette =
          let
            c = config.lib.stylix.colors.withHashtag;
          in
          {
            primary = c.base0D;
            on_primary = c.base00;
            secondary = c.base0D;
            on_secondary = c.base00;
            tertiary = c.base0D;
            on_tertiary = c.base00;
            error = c.base0D;
            on_error = c.base00;
            surface = c.base00;
            on_surface = c.base05;
            surface_variant = c.base01;
            on_surface_variant = c.base04;
            outline = c.base03;
            shadow = c.base00;
            hover = c.base0D;
            on_hover = c.base00;
          };
      };

      cursor = {
        theme = config.stylix.cursor.name;
        size = config.stylix.cursor.size;
      };
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = with pkgs; [
    ddcutil # this is required for that external-monitor-brightness
    xwayland-satellite # needed by niri
  ];

  # enables brightness controll for external monitor using ddcutil
  hardware.i2c.enable = true;
}
