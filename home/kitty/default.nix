{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.victor-mono
  ];

  stylix.targets.kitty.enable = true;

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
      mode = "no-title no-cwd";
    };

    settings = {
      placement_strategy = "center";
      window_padding_width = "4 4";
      background_blur = 40;
      hide_window_decorations = true;
      enable_audio_bell = false;
      window_alert_on_bell = false;

      # main font handled by stylix
      bold_font = "JetBrainsMono NF";
      italic_font = "VictorMono Nerd Font";
      bold_italic_font = "VictorMono Nerd Font";
    };
  };
}
