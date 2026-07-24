{ pkgs, ... }:
{
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
  };

  environment.systemPackages = with pkgs; [
    ddcutil # this is required for that external-monitor-brightness
    xwayland-satellite # needed by niri
  ];

  # enables brightness controll for external monitor using ddcutil
  hardware.i2c.enable = true;
}
