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

    settings = {
      session.default = "niri";

      appearance = {
        font_family = config.stylix.fonts.serif.name;
        hide_logo = true;
        password_style = "random";
        theme_mode = config.stylix.polarity;
        wallpaper.path = config.stylix.image;
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
