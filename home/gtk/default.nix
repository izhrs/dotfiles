# source: https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/

{ pkgs, lib, ... }: {
  catppuccin.gtk.icon = {
    enable = true;
    accent = "lavender";
    flavor = "mocha";
  };

  specialisation.light.configuration = {
    catppuccin.gtk.icon = lib.mkForce {
      enable = true;
      accent = "lavender";
      flavor = "latte";
    };

    gtk.theme = {
      package = lib.mkForce (
        pkgs.catppuccin-gtk.override {
          accents = [ "lavender" ];
          size = "standard";
          variant = "latte";
        }
      );
      name = lib.mkForce "catppuccin-latte-lavender-standard";
    };
  };

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
      name = "Open Sans";
      size = 10;
    };
  };
}
