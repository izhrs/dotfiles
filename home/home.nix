{ pkgs, ... }: {
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    tela-circle-icon-theme
  ];

  home.file = { };

  home.sessionVariables = {
    XDG_TERMINAL_EMULATOR = "wezterm";

    NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_SESSION_TYPE = "wayland";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  programs.home-manager.enable = true;

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = [ "wezterm.desktop" ];
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };
}
