{ lib, pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";
    image = ../wallpapers/a_pixel_nap.png;

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
      image = lib.mkForce ../wallpapers/anime_waifu.png;
      polarity = lib.mkForce "light";
    };
  };

  # specialisation.game.configuration = {
  #   stylix = {
  #     image = lib.mkForce ../wallpapers/hiroki_ree.png;
  #     polarity = lib.mkForce "dark";

  #     opacity = lib.mkForce {
  #       applications = 1.0;
  #       desktop = 1.0;
  #       popups = 1.0;
  #       terminal = 1.0;
  #     };
  #   };
  # };
}
