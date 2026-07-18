{ pkgs, ... }:
let
  themes = import ./themes.nix;
in
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.victor-mono
  ];

  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
      enableBashIntegration = true;
      mode = "no-title no-cwd";
    };

    font = {
      name = "JetBrainsMono NFM Regular";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 12;
    };

    settings = {
      background_opacity = 0.8;
      placement_strategy = "center";
      window_padding_width = "4 4";
      background_blur = 40;
      hide_window_decorations = true;
      enable_audio_bell = false;
      window_alert_on_bell = false;

      bold_font = "JetBrainsMono NF";
      italic_font = "VictorMono Nerd Font";
      bold_italic_font = "VictorMono Nerd Font";
    };
  };

  home.file = {
    ".config/kitty/dark-theme.auto.conf".text = themes.catppuccin_mocha;
    ".config/kitty/light-theme.auto.conf".text = themes.catppuccin_latte;
    ".config/kitty/no-preference-theme.auto.conf".text = themes.catppuccin_mocha;
  };
}
