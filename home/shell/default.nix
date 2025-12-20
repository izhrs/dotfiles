{
  catppuccin = {
    bat = {
      enable = true;
      flavor = "mocha";
    };

    fzf = {
      enable = true;
      flavor = "mocha";
    };
  };

  # enable bash too just so home-manager can manage it
  programs.bash = {
    enable = true;

    shellAliases = {
      e = "hx .";
      vi = "hx";
      vim = "hx";
      cat = "bat";
      ps = "procs";
      l = "ls -l";
      ll = "ls -la";
      diff = "delta";
      serve = "miniserve";
      fm = "yazi";
      gg = "lazygit";
      ff = "fastfetch";
      gc = "nix-collect-garbage -d";
    };
  };

  programs.zsh = {
    enable = true;
    autocd = true;

    # vim mode (helix mode plugins did not work for me)
    defaultKeymap = "viins";

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      append = true;
      findNoDups = true;
      ignoreSpace = true;
    };

    shellAliases = {
      e = "hx .";
      vi = "hx";
      vim = "hx";
      cat = "bat";
      ps = "procs";
      l = "ls -l";
      ll = "ls -la";
      diff = "delta";
      serve = "miniserve";
      fm = "yazi";
      gg = "lazygit";
      ff = "fastfetch";
      gc = "nix-collect-garbage -d";
    };
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
