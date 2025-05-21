{
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "24.11";

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = { EDITOR = "nvim"; };

  # for non nixos
  # home.shell.enableNushellIntegration = true;

  programs.home-manager.enable = true;

  xdg.mimeApps.defaultApplications = { "text/plain" = [ "neovide.desktop" ]; };

  programs.git = {
    enable = true;
    userName = "izhrs";
    userEmail = "mohamed@izhar.xyz";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
      };

    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        pager = "delta --dark --line-numbers --side-by-side --paging=never";
        colorArg = "always";
        useConfig = false;
      };
    };
  };

  programs.nushell = {
    enable = true;
    settings = { show_banner = false; };
    environmentVariables = { EDITOR = "nvim"; };
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      cat = "bat";
      ps = "procs";
      l = "ls -l";
      ll = "ls -la";
      diff = "delta";
      serve = "miniserve";
      fm = "yazi";
      gg = "lazygit";
    };
  };

  # shell completion
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.fastfetch = { enable = true; };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    options = [ "--cmd cd" ];
  };
}
