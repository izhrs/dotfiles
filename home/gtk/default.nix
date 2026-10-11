{ pkgs, ... }: {
  stylix.targets.gtk.colors.enable = false;
  stylix.targets.qt.colors.enable = false;
  # stylix.icons.enable = false;

  # this is required for noctalia to theme gtk3 applications
  # stylix does it automatically
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig.gtk-decoration-layout = ":close";
    gtk4.extraConfig.gtk-decoration-layout = ":close";

    # gtk4.extraCss = ''
    #   @import url("noctalia.css");

    #   window {
    #       background: alpha(@window_bg_color, ${toString config.stylix.opacity.applications});
    #   }

    #   .sidebar-pane,
    #   .sidebar,
    #   .navigation-sidebar {
    #       background: transparent;
    #   }
    # '';
  };

  # dconf.settings = {
  #   "org/gnome/desktop/wm/preferences" = {
  #     # Hides maximize and minimize buttons and
  #     # places the close button at the top right
  #     button-layout = ":close";

  #     # Hides maximize and minimize buttons and
  #     # places the close button at the top left
  #     # button-layout = "close:";

  #     # Hides all window action buttons
  #     # button-layout = "";
  #   };
  # };

  home.packages = [
    (pkgs.writeShellScriptBin "gnome-control-center" ''
      export XDG_CURRENT_DESKTOP=GNOME
      exec ${pkgs.gnome-control-center}/bin/gnome-control-center "$@"
    '')

    (pkgs.writeShellScriptBin "gnome-settings" ''
      export XDG_CURRENT_DESKTOP=GNOME
      exec ${pkgs.gnome-control-center}/bin/gnome-control-center "$@"
    '')
  ];
  xdg.desktopEntries.gnome-control-center = {
    name = "Settings";
    genericName = "Settings";
    comment = "GNOME Control Center, including Online Accounts";
    exec = "gnome-settings";
    terminal = false;
    type = "Application";
    icon = "org.gnome.Settings";
    categories = [
      "Settings"
      "GNOME"
      "GTK"
    ];
    startupNotify = true;
  };
}
