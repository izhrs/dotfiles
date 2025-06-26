{
  # enable bash too just so home-manager can manage it
  programs.bash = {
    enable = true;

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
      ff = "fastfetch";
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      append = true;
      findNoDups = true;
      ignoreSpace = true;
    };

    shellAliases = {
      vi = "nvim .";
      vim = "nvim";
      cat = "bat";
      ps = "procs";
      l = "ls -l";
      ll = "ls -la";
      diff = "delta";
      serve = "miniserve";
      fm = "yazi";
      gg = "lazygit";
      ff = "fastfetch";
    };

    sessionVariables = { EDITOR = "nvim"; };
  };

  # shell completion 
  # and no, i ain't putting this 3 lines in a new file. 
  # fcuk your seperation of concerns and 
  # fcuk you all who puts one line in a new file
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # better cd
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };
}
