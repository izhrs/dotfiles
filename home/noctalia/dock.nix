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

  pinned = [
    "kitty"
    "yazi"
    "org.gnome.Nautilus"
    "firefox"
    "thunderbird"
    "org.godotengine.Godot4.7"
    "gimp"
    "com.dec05eba.gpu_screen_recorder"
    "bottom"
    "virt-manager"
    "de.haeckerfelix.Fragments"
    "de.haeckerfelix.Shortwave"
    "com.rafaelmardojai.Blanket"
    "proton.vpn.app.gtk"
    "LocalSend"
    "com.heroicgameslauncher.hgl"
    "net.lutris.Lutris"
    "steam"
    "re.sonny.Tangram"
  ];
}
