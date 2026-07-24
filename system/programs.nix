{ inputs, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs = {
    # nix-helper cli tool
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 3";
    };

    thunderbird.enable = true;

    zsh.enable = true;
    # Enable Nix-ld for dynamic linking (running elf binaries)
    nix-ld.enable = true;
    steam.enable = true;
    # to use gamemode with steam edit launch options inside
    # game -> general -> launch options -> `gamemoderun %command%`
    gamemode.enable = true;

    obs-studio.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # CLI tools
    android-tools
    bat
    bottom
    delta
    dust
    fd
    ffmpeg-full
    file
    fzf
    lazygit
    nix-output-monitor # for nh
    nvd # for nh
    procs
    ripgrep
    rnr
    sd
    tokei
    yt-dlp

    # networking
    curl
    dnsutils # dig
    inetutils
    iputils # ping
    miniserve
    nettools
    nmap
    rsync
    wget

    # remote access
    freerdp

    # archives
    gnutar
    p7zip
    unzip
    xz
    zip

    # system
    brightnessctl
    lshw
    lsof
    ltrace
    pass
    pciutils # lspci
    strace
    sysstat
    ueberzugpp
    usbutils # lsusb
    wl-clipboard

    # GUI
    gimp
    godot
    libreoffice
    proton-vpn
    qbittorrent
    spotube
    # winboat
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Gaming
    heroic
    lutris
  ];
}
