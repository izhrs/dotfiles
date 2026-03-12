{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./fileSystems.nix
    # ./kanata.nix
    ./locale.nix
    ./network.nix
    ./nvidia.nix
    ./programs.nix
    ./services.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "26.05";

  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";

  security.rtkit.enable = true;
}
