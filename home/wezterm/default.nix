{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require("wezterm");

      return {
        font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
        font_size = 13.0,

        enable_wayland = true,
        enable_scroll_bar = false,
        enable_kitty_keyboard = true,
        check_for_updates = false,

        default_cursor_style = "BlinkingBar",
        cursor_blink_ease_in = "Linear",
        cursor_blink_ease_out = "Linear",
        cursor_blink_rate = 600,
        cursor_thickness = 1,

        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        enable_tab_bar = false,
        scrollback_lines = 10000,
        adjust_window_size_when_changing_font_size = false,
        audible_bell = "Disabled",
        clean_exit_codes = { 130 },
        window_background_opacity = 0.8,

        color_scheme = "Catppuccin Mocha",
        colors = {
          background = "#0f0f16",  -- darker shade of #1E1E2E
        }
      }
    '';
  };
}
