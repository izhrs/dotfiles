{ pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services = {
    # login manager
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
  };
}
