{
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };

  programs.zathura = {
    enable = true;
    options = {
      database = "sqlite";
      font = "JetBrainsMono Nerd Font 10";
      window-title-basename = true;
      window-title-page = false;

      selection-clipboard = "clipboard";

      default-bg = "#11111b"; # catppuccin crust
      default-fg = "#cdd6f4"; # catppuccin text
      highlight-color = "rgba(180, 190, 254, 0.5)"; # lavender
      highlight-active-color = "rgba(203, 166, 247, 0.5)"; # mauve
      highlight-fg = "#11111b"; # crust
      page-padding = 2;

      statusbar-bg = "#11111b"; # crust
      statusbar-fg = "#cdd6f4"; # text
      statusbar-v-padding = 4;
      statusbar-h-padding = 8;

      inputbar-bg = "#1e1e2e"; # base
      inputbar-fg = "#b4befe"; # lavender

      index-bg = "#1e1e2e"; # base
      index-active-fg = "#b4befe"; # lavender
      index-fg = "#cdd6f4"; # text

      completion-bg = "#1e1e2e"; # base
      completion-fg = "#cdd6f4"; # text
      completion-highlight-fg = "#11111b"; # crust
      completion-highlight-bg = "#b4befe"; # lavender

      notification-fg = "#11111b"; # crust
      notification-bg = "#a6e3a1"; # green

      notification-error-fg = "#11111b"; # crust
      notification-error-bg = "#f38ba8"; # red

      notification-warning-fg = "#11111b"; # crust
      notification-warning-bg = "#f9e2af"; # yellow
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
