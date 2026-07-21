{ config, pkgs, ... }:
{
  stylix.targets.rofi.enable = false;

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

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${config.lib.stylix.colors.base05}";
          margin = 0;
          padding = 0;
        };

        "window" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base00}cc";
          border-radius = mkLiteral "8px";
          width = mkLiteral "32em";
        };

        "inputbar" = {
          children = map mkLiteral [ "entry" ];
          background-color = mkLiteral "#${config.lib.stylix.colors.base01}cc";
        };

        "entry" = {
          placeholder = " ";
          placeholder-color = mkLiteral "#${config.lib.stylix.colors.base04}";

          # border = mkLiteral "2px solid";
          # border-color = mkLiteral "#${config.lib.stylix.colors.base07}";
          # border-radius = mkLiteral "8px";
          # margin = mkLiteral "0.75em";

          padding = mkLiteral "0.75em 1.25em";
        };

        "listview" = {
          lines = 6;
          margin = mkLiteral "0.5em 0 0.75em";
        };

        "element" = {
          padding = mkLiteral "0.5em";
          margin = mkLiteral "0 0.75em";
        };

        "element selected" = {
          background-color = mkLiteral "#${config.lib.stylix.colors.base07}";
          border-radius = mkLiteral "8px";
        };

        "element-text" = {
          highlight = mkLiteral "bold";
          padding = mkLiteral "0.25em";
          font = "Open Sans 14px";
        };

        "element-text selected" = {
          color = mkLiteral "#${config.lib.stylix.colors.base01}";
        };

        "element-icon" = {
          size = mkLiteral "1.5em";
        };
      };
  };
}
