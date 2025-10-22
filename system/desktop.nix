{ pkgs, ... }: {
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
    cosmic-edit
    cosmic-term
  ];

  environment.systemPackages = with pkgs; [
    cosmic-ext-calculator
    cosmic-ext-applet-external-monitor-brightness
    forecast
  ];
}
