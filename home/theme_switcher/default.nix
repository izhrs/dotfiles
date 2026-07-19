{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "light" ''
      $(fd -td ".*.home-manager-generation" /nix/store/ -x fd -td "specialisation" {} | head -1)/light/activate
    '')

    (writeShellScriptBin "dark" ''
      $(fd -td ".*.home-manager-generation" /nix/store/ -x fd -td "specialisation" {} | head -1)/../activate
    '')
  ];

  # I tried wrapping dark-mode desktop entry in light Specialisation so there would have been
  # only one destop entry at a time but it didn't work. Same thing I did with scripts but no luck

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
