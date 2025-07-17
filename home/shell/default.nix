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

  programs.eza = {
    enable = true;
    icons = "auto";

    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
