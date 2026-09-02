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

  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      # Hides maximize and minimize buttons and
      # places the close button at the top right
      button-layout = ":close";

      # Hides maximize and minimize buttons and
      # places the close button at the top left
      # button-layout = "close:";

      # Hides all window action buttons
      # button-layout = "";
    };
  };
}
