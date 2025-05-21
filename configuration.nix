{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "24.11";

  # Bootloader
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 0;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 3000 5173 8000 8080 ];
      allowedUDPPorts = [ ];
    };
  };

  services = {
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
    xserver.desktopManager.gnome.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    # Enable touchpad support (enabled default in most desktopManager).
    # xserver.libinput.enable = true;

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # openssh.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users.users.izhrs = {
    isNormalUser = true;
    description = "Mohamed Izhar";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
    shell = pkgs.nushell;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # CLI
    android-tools
    bat
    bottom
    cargo
    curl
    delta
    dust
    fd # for nvim
    fzf # for nvim
    gcc
    home-manager
    k3s
    lazygit # for nvim
    lemonade # ssh clipboard tool for remote nvim
    miniserve
    neovim
    nerd-fonts.jetbrains-mono
    nixfmt-classic # nix formatter for neovim
    nodejs_24
    nodePackages.prettier # for nvim
    nushell
    pciutils # for lspci and other commands
    procs
    python314
    ripgrep # for nvim
    rsync
    rust-analyzer
    sd
    tokei
    tree
    unzip
    wget
    xclip # clipboard tool for nvim
    yarn
    yt-dlp
    zip

    # GUI
    libreoffice
    protonvpn-gui
  ];

  nixpkgs.config.allowUnfree = true;
  programs = {
    firefox.enable = true;
    # Enable Nix-ld for dynamic linking (running elf binaries)
    nix-ld.enable = true;
    steam.enable = true;
  };
}
