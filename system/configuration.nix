{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./bluetooth.nix
    ./fileSystems.nix
    ./kvm.nix
    ./locale.nix
    ./network.nix
    ./nvidia.nix
    ./programs.nix
    ./services.nix
    ./users.nix
  ];

  system.stateVersion = "24.11";

  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.rtkit.enable = true;
}
