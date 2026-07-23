{ inputs, pkgs, ... }:
{
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  programs.niri.enable = true;
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  programs.regreet.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services = {
    # login manager
    # displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    desktopManager.cosmic.xwayland.enable = true;
  };

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-store
    cosmic-term
    cosmic-reader
  ];

  environment.systemPackages = with pkgs; [
    cosmic-ext-calculator
    forecast

    ddcutil # this is required for that external-monitor-brightness
  ];

  # enables brightness controll for external monitor using ddcutil
  hardware.i2c.enable = true;
}
