{
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "24.11";

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
    NIXOS_OZONE_WL = "1";
  };

  # for non nixos
  # home.shell.enableNushellIntegration = true;

  programs.home-manager.enable = true;

  xdg.mimeApps.defaultApplications = { "text/plain" = [ "neovide.desktop" ]; };

  programs.fastfetch = { enable = true; };
}
