{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

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
}
