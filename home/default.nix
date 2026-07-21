{ lib, pkgs, ... }: {
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

  xdg.mimeApps.defaultApplications = {
    "x-scheme-handler/terminal" = [ "kitty.desktop" ];
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
    "image/*" = [ "org.pwmt.zathura.desktop" ];
    "video/*" = [ "com.system76.CosmicPlayer.desktop" ];
    "text/markdown" = [ "inlyne.desktop" ];
  };

  # Stylix is configured at the system level, but image is overridden here
  # which forces stylix to stop inheriting colors as well, so just copied base16Scheme
  # so that Home Manager specialisations can switch to light Specialisation
  # without requiring root. System specialisation activation needs sudo, HM does not.
  # All other stylix settings (opacity, fonts, etc) are inherited from the system config.
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    override = {
      base00 = "11111b"; # crust instead of base
    };

    image = ../wallpapers/pixel-napping.png;
  };

  specialisation.light.configuration = {
    stylix = {
      base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
      override = {
        base00 = "eff1f5"; # do it again otherwise it'll inherit parent's override value.
      };

      image = lib.mkForce ../wallpapers/ign-waifu.png;
    };
  };

  imports = [
    ./btm
    ./cosmic
    ./fastfetch
    ./firefox
    ./gemini
    ./git
    ./gtk
    ./helix
    ./inlyne
    ./kitty
    ./lazygit
    ./nwg-drawer
    ./rofi
    ./serpl
    ./shell
    ./starship
    ./theme_switcher
    ./virtmanager
    ./yazi
    ./zathura
    ./zellij
  ];
}
