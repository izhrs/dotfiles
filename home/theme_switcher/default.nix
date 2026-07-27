{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "light" ''
      /nix/var/nix/profiles/system/specialisation/light/bin/switch-to-configuration switch
    '')

    (writeShellScriptBin "dark" ''
      /nix/var/nix/profiles/system/bin/switch-to-configuration switch
    '')
  ];

  xdg.desktopEntries.light_mode = {
    name = "Light Theme";
    genericName = "Light Theme";
    comment = "Switch to Light theme";
    exec = "pkexec light";
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
    exec = "pkexec dark";
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
