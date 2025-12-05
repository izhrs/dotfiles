# tui find and replace tool
# good for integratinng with terminal editors

{ pkgs, ... }: {
  home.file.".config/serpl/config.json".text = builtins.toJSON {
    keybindings = {
      "<Ctrl-d>" = "Quit";
      "<Ctrl-c>" = "Quit";
      "<Tab>" = "LoopOverTabs";
      "<Backtab>" = "BackLoopOverTabs";
      "<Ctrl-o>" = "ProcessReplace";
      "<?>" = "ShowHelp";
    };
  };

  home.packages = with pkgs; [ serpl ];
}
