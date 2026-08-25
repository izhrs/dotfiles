{ config, ... }: {
  stylix.targets.wezterm.enable = false;
  stylix.targets.wezterm.colors.enable = false;

  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      return {
        color_scheme = "Noctalia",
      	font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
      	window_background_opacity = ${toString config.stylix.opacity.terminal},
      	window_decorations = "NONE",
      	window_padding = {
      		bottom = 2,
      	},

      	enable_scroll_bar = false,
      	enable_kitty_keyboard = true,
      	check_for_updates = false,

      	default_cursor_style = "BlinkingBar",
      	cursor_blink_ease_in = "Linear",
      	cursor_blink_ease_out = "Linear",
      	cursor_blink_rate = 600,
      	cursor_thickness = 1,

      	enable_tab_bar = true,
      	use_fancy_tab_bar = false,
      	hide_tab_bar_if_only_one_tab = true,
      	tab_bar_at_bottom = true,
      	show_new_tab_button_in_tab_bar = false,
      	show_tab_index_in_tab_bar = false,

      	scrollback_lines = 10000,
      	adjust_window_size_when_changing_font_size = false,
      	audible_bell = "Disabled",
      	clean_exit_codes = { 130 },
      }
    '';
  };
}
