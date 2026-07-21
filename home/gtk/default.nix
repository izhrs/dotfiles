{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = [
    (pkgs.catppuccin-gtk.override {
      accents = [ "lavender" ];
      size = "standard";
      variant = "latte";
    })
  ];

  # catppuccin-gtk is better
  stylix.targets.gtk.enable = false;

  gtk = {
    enable = true;

    theme = {
      package = pkgs.catppuccin-gtk.override {
        accents = [ "lavender" ];
        size = "standard";
        variant = "mocha";
      };
      name = "catppuccin-mocha-lavender-standard";
    };

    font = {
      name = config.stylix.fonts.serif.name;
      size = config.stylix.fonts.sizes.applications;
    };
  };

  specialisation.light.configuration = {
    gtk.theme.name = lib.mkForce "catppuccin-latte-lavender-standard";
  };
}
