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
      allowedTCPPorts = [ 22 80 3000 5173 8000 8080 ];
      allowedUDPPorts = [ ];
    };
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      # Enable touchpad support (enabled default in most desktopManager).
      # libinput.enable = true;

      videoDrivers = [ "nvidia" ];
    };

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    pulseaudio.enable = false;

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "izhrs" ];
      };
    };
  };

  hardware = {
    # enable opengl
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.finegrained = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  # virtualisation 
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    spiceUSBRedirection.enable = true;

    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
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

  security.rtkit.enable = true;

  users.users.izhrs = {
    isNormalUser = true;
    description = "Mohamed Izhar";
    extraGroups =
      [ "networkmanager" "wheel" "libvirtd" "kvm" "adbusers" "docker" ];
    packages = [ ];
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager

    # Development
    rustup
    gcc
    musl
    nodejs_24
    python314
    uv # python package manager
    docker-compose
    powershell

    helix
    zed-editor

    # CLI tools
    android-tools
    bat
    bottom
    curl
    delta
    dust
    fd
    file
    fzf
    k3s
    lazygit
    miniserve
    neovim
    procs
    ripgrep
    rsync
    sd
    tokei
    tree
    unzip
    wget
    yarn
    yt-dlp

    # networking
    dnsutils # dig
    iputils # ping
    nettools

    # archives
    gnutar
    p7zip
    unzip
    xz
    zip

    # system
    lsof
    ltrace
    pciutils # lspci
    strace
    sysstat
    usbutils # lsusb
    brightnessctl

    # UI
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono

    # GUI
    libreoffice
    protonvpn-gui
    qbittorrent
    # gimp
    godot

    # Media
    mpv

    # Gaming
    lutris
    heroic
  ];

  nixpkgs.config.allowUnfree = true;
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    # Enable Nix-ld for dynamic linking (running elf binaries)
    nix-ld.enable = true;
    steam.enable = true;
    # to use gamemode with steam edit launch options inside
    # game -> general -> launch options -> `gamemoderun %command%`
    gamemode.enable = true;

    # virtualisation
    virt-manager.enable = true;
    adb.enable = true;

    obs-studio.enable = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
