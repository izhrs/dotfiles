{ lib, pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";
    image = ../wallpapers/tsukatsuki_rio_dark.jpeg;

    targets.fontconfig.enable = true;
    fonts = {
      serif = {
        package = pkgs.open-sans;
        name = "Open Sans";
      };
      sansSerif = {
        package = pkgs.open-sans;
        name = "Open Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono NFM Regular";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 10;
        desktop = 10;
        terminal = 12;
      };
    };

    opacity = {
      applications = 0.8;
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };

    icons = {
      enable = true;
      package = pkgs.colloid-icon-theme.override {
        schemeVariants = [ "all" ];
        colorVariants = [ "all" ];
      };

      dark = "Colloid-Purple-Catppuccin";
      light = "Colloid-Purple-Catppuccin";
    };

    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 32;
    };
  };

  specialisation.light.configuration = {
    stylix = {
      image = lib.mkForce ../wallpapers/tsukatsuki_rio_light.jpeg;
      polarity = lib.mkForce "light";
    };
  };
}
