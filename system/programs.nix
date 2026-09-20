{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # for virtual filesystems in nautilus like trash, sftp etc
  services.gvfs.enable = true;

  programs = {
    # nix-helper cli tool
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 3";
    };

    zsh.enable = true;
    # Enable Nix-ld for dynamic linking (running elf binaries)
    nix-ld.enable = true;
    steam.enable = true;

    # obs-studio.enable = true;
    gpu-screen-recorder.enable = true;

    localsend = {
      enable = true;
      openFirewall = true; # opens 53117 port
    };

    nautilus-open-any-terminal = {
      enable = true;
      terminal = "wezterm";
    };
  };

  environment.systemPackages = with pkgs; [
    # CLI tools
    android-tools
    bat
    bottom
    delta
    devenv
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
    gtk3
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
    mpv
    onlyoffice-desktopeditors
    proton-vpn

    # GUI (libadwaita/gtk4)
    amberol # music player
    baobab # disk usage analyzer
    fragments # torrent downloader
    gnome-calculator
    gnome-chess
    gpu-screen-recorder-gtk
    loupe # image viewer
    nautilus # file manager
    pinta # image editor
    rnote
    # gnome web browser; I use it for creating webapps coz it looks
    # cleaner than firefox and I dont need extensions for the sites like web.whatsapp
    epiphany

    # some other GUIs are in ./flatpak.nix
  ];
}
