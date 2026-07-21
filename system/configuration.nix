{
  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./fileSystems.nix
    ./locale.nix
    ./network.nix
    ./nvidia.nix
    ./programs.nix
    ./services.nix
    ./stylix.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "26.05";

  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;

    consoleLogLevel = 3;
    initrd.verbose = false;
    initrd.systemd.enable = true;

    kernelParams = [
      "quiet"
      "splash"
      "intremap=on"
      "boot.shell_on_fail"
    ];

    # boot theme will be handled by stylix
    plymouth.enable = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  security.rtkit.enable = true;
}
