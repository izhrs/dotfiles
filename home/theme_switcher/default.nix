{ pkgs, lib, ... }:
{
  # requires services.awww.enable = true;
  # I did that in niri config
  home.packages = with pkgs; [
    (writeShellScriptBin "light" ''
      pkexec sh -c "/nix/var/nix/profiles/system/specialisation/light/bin/switch-to-configuration switch &"
      awww img ~/Pictures/wallpapers/gifs/aeolian.gif --transition-type center --transition-step 120 --transition-fps 120 --transition-duration 1.5
      dconf write /org/gnome/desktop/interface/color-scheme '"prefer-light"'
    '')

    (writeShellScriptBin "dark" ''
      pkexec sh -c "/nix/var/nix/profiles/system/bin/switch-to-configuration switch &"
      awww img ~/Pictures/wallpapers/gifs/lonely_cat.gif --transition-type center --transition-step 120 --transition-fps 120 --transition-duration 1.5
      dconf write /org/gnome/desktop/interface/color-scheme '"prefer-dark"'
    '')
  ];

  xdg.desktopEntries.light_mode = {
    name = "Light Theme";
    genericName = "Light Theme";
    comment = "Switch to Light theme";
    exec = "light";
    terminal = false;
    type = "Application";
    icon = "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/redshift.svg";
    categories = [
      "Settings"
      "DesktopSettings"
      "Utility"
    ];
    startupNotify = true;
  };

  xdg.desktopEntries.dark_mode = lib.mkForce {
    name = "Dark Theme";
    genericName = "Dark Theme";
    comment = "Switch to Dark theme";
    exec = "dark";
    terminal = false;
    type = "Application";
    icon = "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/distributor-logo-budgie.svg";
    categories = [
      "Settings"
      "DesktopSettings"
      "Utility"
    ];
    startupNotify = true;
  };
}
