{ lib, pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    override = {
      base00 = "11111b"; # crust instead of base
    };

    polarity = "dark";

    # overridden in home-manager
    image = ../wallpapers/momo_ayase.jpg;

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
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };

      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 12;
    };
  };

  specialisation.light.configuration = {
    stylix = {
      base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
      override = {
        base00 = "eff1f5"; # do it again otherwise it'll inherit parent's override value.
      };

      # overridden in home-manager
      image = lib.mkForce ../wallpapers/railroad-cat.png;
      polarity = lib.mkForce "light";
    };
  };
}
