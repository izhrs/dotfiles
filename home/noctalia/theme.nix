{ config, lib }: {
  mode = lib.mkForce config.stylix.polarity;
  source = lib.mkForce "wallpaper";
  wallpaper_scheme = "m3-tonal-spot";

  templates = {
    builtin_ids = [
      "gtk3"
      "gtk4"
      "helix"
      "niri"
      "qt"
      "starship"
      "wezterm"
    ];

    community_ids = [
      "bat"
      "discord"
      "gimp"
      "heroiclauncher"
      "lazygit"
      "libreoffice"
      "papirus-icons"
      "pywalfox"
      "steam"
      "yazi"
      "zathura"
      "zed"
      "zellij"
    ];
  };
}
