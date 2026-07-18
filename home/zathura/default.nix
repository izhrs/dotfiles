{ lib, ... }: {
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

  specialisation.light.configuration = {
    programs.zathura.options = lib.mkForce {
      database = "sqlite";
      font = "JetBrainsMono Nerd Font 10";
      window-title-basename = true;
      window-title-page = false;
      selection-clipboard = "clipboard";
      default-bg = "#dce0e8"; # latte crust
      default-fg = "#11111b"; # latte text
      highlight-color = "rgba(114, 135, 253, 0.5)"; # latte lavender
      highlight-active-color = "rgba(136, 57, 239, 0.5)"; # latte mauve
      highlight-fg = "#dce0e8"; # latte crust
      page-padding = 2;
      statusbar-bg = "#dce0e8"; # latte crust
      statusbar-fg = "#11111b"; # latte text
      statusbar-v-padding = 4;
      statusbar-h-padding = 8;
      inputbar-bg = "#eff1f5"; # latte base
      inputbar-fg = "#7287fd"; # latte lavender
      index-bg = "#eff1f5"; # latte base
      index-active-fg = "#7287fd"; # latte lavender
      index-fg = "#11111b"; # latte text
      completion-bg = "#eff1f5"; # latte base
      completion-fg = "#11111b"; # latte text
      completion-highlight-fg = "#dce0e8"; # latte crust
      completion-highlight-bg = "#7287fd"; # latte lavender
      notification-fg = "#dce0e8"; # latte crust
      notification-bg = "#40a02b"; # latte green
      notification-error-fg = "#dce0e8"; # latte crust
      notification-error-bg = "#d20f39"; # latte red
      notification-warning-fg = "#dce0e8"; # latte crust
      notification-warning-bg = "#df8e1d"; # latte yellow
    };
  };
}
