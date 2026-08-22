{ inputs, ... }:
{
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "26.05";

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

  home.pointerCursor.enable = true;
  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = [ "kitty.desktop" ];
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    "image/*" = [ "org.pwmt.zathura.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "text/*" = [ "Helix.desktop" ];
    "text/markdown" = [ "inlyne.desktop" ];
  };

  imports = [
    ./btm
    ./fastfetch
    ./firefox
    ./git
    ./helix
    ./inlyne
    ./kitty
    ./lazygit
    ./mpv
    ./niri
    ./noctalia
    ./serpl
    ./shell
    ./starship
    ./theme-switcher
    ./virtmanager
    ./yazi
    ./zathura
    ./zellij

    inputs.noctalia.homeModules.default
  ];
}
