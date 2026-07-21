{
  stylix.targets.zathura.enable = true;

  programs.zathura = {
    enable = true;
    options = {
      database = "sqlite";
      font = "JetBrainsMono Nerd Font 10";
      window-title-basename = true;
      window-title-page = false;

      selection-clipboard = "clipboard";

      page-padding = 2;

      statusbar-v-padding = 4;
      statusbar-h-padding = 8;
    };

    extraConfig = ''
      unmap o
    '';

    mappings = {
      "<C-o>" = "open";
      "<C-p>" = "print";
      "<C-s>" = "write";
      ge = "scroll bottom";
      i = "zoom in";
      o = "zoom out";
    };
  };
}
