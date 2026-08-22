{
  imports = [
    ./hardware-configuration.nix
    ./audio.nix
    ./bluetooth.nix
    ./desktop.nix
    ./file-systems.nix
    ./graphics.nix
    ./locale.nix
    ./network.nix
    ./power-management.nix
    ./programs.nix
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

  # misc; not large enough to put them into seperate file
  security.rtkit.enable = true;
  services.printing.enable = true;
}
