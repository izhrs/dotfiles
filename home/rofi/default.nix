{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [ rofi-emoji rofi-calc ];
    extraConfig = {
      modi = "drun,emoji";
      font = "Ubuntu Nerd Font 16px";
      display-drun = "Applications";
      drun-display-format = "{icon} {name}";
      icon-theme = "Tela-Circle";
      cycle = false;
    };
    theme = ./index.rasi;
  };
}

