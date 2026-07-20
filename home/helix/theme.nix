{
  # transparent catppuccin that use borders instead of bg-color
  catppuccin_mocha_transparent = {
    inherits = "catppuccin_mocha";
    "ui.background" = { };
    "ui.popup" = { };
    "ui.virtual.inlay-hint" = {
      fg = "#6c7086";
    };
  };

  catppuccin_latte_transparent = {
    inherits = "catppuccin_latte";
    "ui.background" = { };
    "ui.text" = "#11111b";
    "ui.popup" = { };
    "ui.virtual.inlay-hint" = {
      fg = "#7c7f93";
    };
  };
}
