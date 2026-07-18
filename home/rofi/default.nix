{ pkgs, lib, ... }: {
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
    ];
    extraConfig = {
      modi = "drun,emoji";
      font = "Open Sans 14px";
      display-drun = "Applications";
      drun-display-format = "{icon} {name}";
      icon-theme = "Tela-Circle";
      cycle = false;
    };
    theme = ./index.rasi;

  };

  specialisation.light.configuration = {
    programs.rofi.theme = lib.mkForce ./light.rasi;
  };
}
