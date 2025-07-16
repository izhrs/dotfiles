{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require("wezterm");
      local act = wezterm.action;

      return {
        font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
        font_size = 13.0,
        window_background_opacity = 0.8,

        enable_wayland = true,
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

        scrollback_lines = 10000,
        adjust_window_size_when_changing_font_size = false,
        audible_bell = "Disabled",
        clean_exit_codes = { 130 },

        color_scheme = "Catppuccin Mocha",

        colors = {
          background = "#0f0f16",  -- darker shade of #1E1E2E

          tab_bar = {
            background = "#0f0f16",
            foreground = "#cdd6f4",
            
            active_tab = {
              bg_color = "#b4befe",
              fg_color = "#11111b",
            },
          }
        },

        keys = {
          { key = '1', mods = 'ALT', action = act.ActivateTab(0) },
          { key = '2', mods = 'ALT', action = act.ActivateTab(1) },
          { key = '3', mods = 'ALT', action = act.ActivateTab(2) },
          { key = '4', mods = 'ALT', action = act.ActivateTab(3) },
          { key = '5', mods = 'ALT', action = act.ActivateTab(4) },
          { key = '6', mods = 'ALT', action = act.ActivateTab(5) },
          { key = '7', mods = 'ALT', action = act.ActivateTab(6) },
          { key = '8', mods = 'ALT', action = act.ActivateTab(7) },
          { key = '9', mods = 'ALT', action = act.ActivateTab(-1) },

          { key = 'Enter', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' },
          { key = 'w', mods = 'ALT', action = act.CloseCurrentTab { confirm = true } },

          { key = '/', mods = 'ALT', action = act.Search 'CurrentSelectionOrEmptyString' },
          { key = 'v', mods = 'ALT', action = act.ActivateCopyMode }
        }
      }
    '';
  };
}
