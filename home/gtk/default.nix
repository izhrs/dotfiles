# source: https://wiki.hyprland.org/Nix/Hyprland-on-Home-Manager/

{ pkgs, ... }: {
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 5;
  # };

  gtk = {
    enable = true;

    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };

    iconTheme = {
      package = pkgs.tela-circle-icon-theme;
      name = "Tela-Circle";
    };

    # font = {
    #   name = "Ubuntu Nerd Font";
    #   size = 12;
    # };
  };
}
