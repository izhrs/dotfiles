{ config }: {
  enabled = true;
  position = "bottom";
  background_opacity = config.stylix.opacity.desktop;
  shadow = false;
  radius = 12;
  margin_edge = 8;
  smart_auto_hide = true;
  reserve_space = false;
  inactive_opacity = 1;
  cross_axis_padding = 0;
  icon_size = 56;
  main_axis_padding = 0;

  pinned = [
    "org.wezfurlong.wezterm"
    "org.gnome.Nautilus"
    "firefox"

    # tools
    "onlyoffice-desktopeditors"
    "com.github.flxzt.rnote"
    "com.github.PintaProject.Pinta"
    "virt-manager"
    "de.haeckerfelix.Fragments"
    "de.haeckerfelix.Shortwave"
    "proton.vpn.app.gtk"
    "LocalSend"

    # reading
    "com.github.johnfactotum.Foliate"
    "info.febvre.Komikku"

    # Communication
    "vesktop"

    # Games
    "steam"

    # System
    "io.github.kolunmi.Bazaar"
  ];
}
