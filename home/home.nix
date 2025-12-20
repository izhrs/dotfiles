{ pkgs, ... }: {
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "24.11";

  home.file = { };

  home.sessionVariables = {
    TERMINAL = "kitty";
    XDG_TERMINAL_EMULATOR = "kitty";

    NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XDG_SESSION_TYPE = "wayland";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
  };

  programs.home-manager.enable = true;

  # default set in individiual configs as well (duplication for better readablity)

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = [ "kitty.desktop" ];
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    "image/*" = [ "swayimg.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "text/markdown" = [ "inlyne.desktop" ];
  };
}
