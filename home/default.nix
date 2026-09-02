{
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "26.05";

  home.file = { };

  home.sessionVariables = {
    TERMINAL = "wezterm";
    XDG_TERMINAL_EMULATOR = "wezterm";

    NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_SESSION_TYPE = "wayland";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  programs.home-manager.enable = true;

  home.pointerCursor.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = [ "org.wezfurlong.wezterm.desktop" ];
    "x-scheme-handler/appstream" = [ "io.github.kolunmi.Bazaar.desktop" ];
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    "image/*" = [ "org.pwmt.zathura.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "text/*" = [ "Helix.desktop" ];
    "text/markdown" = [ "inlyne.desktop" ];
  };

  imports = [
    ./discord
    ./fastfetch
    ./firefox
    ./git
    ./gtk
    ./helix
    ./inlyne
    ./lazygit
    ./mpv
    ./niri
    ./noctalia
    ./serpl
    ./shell
    ./starship
    ./virtmanager
    ./wezterm
    ./yazi
    ./zathura
    ./zellij
  ];
}
