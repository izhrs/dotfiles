{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.victor-mono
  ];

  stylix.targets.kitty.enable = true;
  stylix.targets.kitty.colors.enable = false;

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
      mode = "no-title no-cwd";
    };

    extraConfig = "include themes/noctalia.conf";

    settings = {
      placement_strategy = "center";
      window_padding_width = "4 4";
      hide_window_decorations = true;
      enable_audio_bell = false;
      window_alert_on_bell = false;

      cursor_trail = 10;
      cursor_trail_decay = "0.2 0.4";

      # main font handled by stylix
      bold_font = "JetBrainsMono NF";
      italic_font = "VictorMono Nerd Font";
      bold_italic_font = "VictorMono Nerd Font";
    };
  };
}
