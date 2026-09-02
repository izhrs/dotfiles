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

    # Office
    "org.gnome.Evolution"
    "me.proton.Mail"
    "onlyoffice-desktopeditors"
    "com.github.xournalpp.xournalpp"
    "com.github.johnfactotum.Foliate"

    # Creative
    "com.github.PintaProject.Pinta"

    # Tools
    "virt-manager"
    "de.haeckerfelix.Fragments"
    "de.haeckerfelix.Shortwave"
    "proton.vpn.app.gtk"
    "LocalSend"

    # Communication
    "vesktop"
    "re.sonny.Tangram"

    # Games
    "steam"

    # System
    "io.github.kolunmi.Bazaar"
  ];
}
