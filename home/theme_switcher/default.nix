{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "switch-theme" ''
      $(fd -td ".*.home-manager-generation" /nix/store/ -x fd -td "specialisation" {} | head -1)/light/activate
    '')
  ];

  xdg.desktopEntries.theme_switcher = {
    name = "Light Theme";
    genericName = "Light Theme";
    comment = "Switch to Light theme";
    exec = "switch-theme";
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

  specialisation.light.configuration = {
    home.packages = lib.mkForce (
      with pkgs;
      [
        (writeShellScriptBin "switch-theme" ''
          $(fd -td ".*.home-manager-generation" /nix/store/ -x fd -td "specialisation" {} | head -1)/../activate
        '')
      ]
    );

    xdg.desktopEntries.theme_switcher = lib.mkForce {
      name = "Dark Theme";
      genericName = "Dark Theme";
      comment = "Switch to Dark theme";
      exec = "switch-theme";
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
  };
}
