{ pkgs, ... }:
{
  # programs.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  # };

  services = {
    # login manager
    displayManager.cosmic-greeter.enable = true;
    desktopManager.cosmic.enable = true;
    desktopManager.cosmic.xwayland.enable = true;
  };

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-store
    cosmic-term
  ];

  environment.systemPackages = with pkgs; [
    cosmic-ext-calculator
    forecast

    ddcutil # this is required for that external-monitor-brightness
  ];

  # enables brightness controll for external monitor using ddcutil
  hardware.i2c.enable = true;
}
