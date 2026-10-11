{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # for virtual filesystems in nautilus like trash, sftp etc
  # and gnome-fication
  services.gvfs.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.evolution-data-server.enable = true;

  # Flatpak is only a test bench. Try an app here first, then use Flatseal to
  # read its permissions and port it to nixpak if I keep it, or uninstall it.
  # Everything stays in Flatpak's own dirs, so uninstalling flatpak apps leaves
  # no pollution like nix run nixpkgs#something does
  services.flatpak.enable = true;

  services.protonmail-bridge.enable = true;

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
    fd
    ffmpeg-full
    file
    fzf
    lazygit
    nix-output-monitor # for nh
    nvd # for nh
    procs
    ripgrep
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

    # GNOME; -- trigger warning
    baobab # disk usage analyzer
    gnome-calculator
    gnome-calendar
    gnome-connections
    gnome-contacts
    gnome-chess
    gnome-control-center
    loupe # image viewer
    nautilus # file manager
    epiphany

    # GUI (libadwaita/gtk4)
    amberol # music player
    bobby
    fragments # torrent downloader

    gpu-screen-recorder-gtk
    mission-center # resource/task manager
    mousam # weather
    pinta # image editor
    proton-vpn
    rnote
    snapshot # camera
    upscaler
    video-downloader

    # some other GUIs are in ./sandboxed
  ];
}
