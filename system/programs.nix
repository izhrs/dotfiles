{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  # for virtual filesystems in nautilus like trash, sftp etc
  services.gvfs.enable = true;

  # email services
  services.gnome.evolution-data-server.enable = true;
  services.protonmail-bridge.enable = true;

  programs = {
    # nix-helper cli tool
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 3";
    };

    firefox.enable = true;

    zsh.enable = true;
    # Enable Nix-ld for dynamic linking (running elf binaries)
    nix-ld.enable = true;
    steam.enable = true;
    # to use gamemode with steam edit launch options inside
    # game -> general -> launch options -> `gamemoderun %command%`
    gamemode.enable = true;

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
    evolution.enable = true;
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
    # flatpak store for installing "sandboxed" GUI applications
    # I use flatpak instead of `nix run` to try GUI apps
    bazaar
    blanket # soundscapes
    fragments # torrent downloader
    gimp
    godot
    gpu-screen-recorder-gtk
    mpv
    nautilus # files manager
    proton-vpn
    shortwave # radio around the world
    tangram # webapps as desktop
    winboat

    # Gaming
    heroic
    lutris
  ];
}
