# source: https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/

{ pkgs, ... }: {

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 9;
  };

  catppuccin.gtk.icon = {
    enable = true;
    accent = "lavender";
    flavor = "mocha";
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
      name = "Ubuntu Nerd Font";
      size = 10;
    };
  };
}
