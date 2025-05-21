{ pkgs, ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        # cursor-size = 24;
        # font-name = "Fira Code 12";
        # gtk-theme = "Yaru-dark";
        # icon-theme = "Papirus-Dark";
        cursor-theme = "prefer-dark";
        show-battery-percentage = true;
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions =
          [ pkgs.gnomeExtensions.blur-my-shell.extensionUuid ];
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
    };
  };
}
