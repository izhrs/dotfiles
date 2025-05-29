{
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
      # TODO: remove this
      mnt = "~/.local/bin/mnt"; # you don't need this!!
    };
  };

  # shell completion
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  # better cd
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    options = [ "--cmd cd" ];
  };
}
