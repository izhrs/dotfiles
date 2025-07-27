local wezterm = require("wezterm")
local act = wezterm.action

local icon_map = {
    bottom = " ",
    btm = " ",
    nvim = " ",
    vim = " ",
    helix = " 󰚄",
    hx = " 󰚄",
    bash = " 󱄅",
    fish = " ",
    zsh = " 󱄅",
    python = " ",
    node = " ",
    yarn = " ",
    deno = " ",
    ssh = " ",
    lazygit = " ",
    cargo = " ",
    docker = " ",
    yazi = " ",
}

local function icon_for_title(title)
    local lowered = string.lower(title or "")

    -- First try exact match
    if icon_map[lowered] then
        return icon_map[lowered]
    end

    -- Try substring matching
    for key, icon in pairs(icon_map) do
        if string.find(lowered, key, 1, true) then
            return icon
        end
    end

    -- Fallback default icon
    return " "
end

local function tab_title(tab_info)
    local title = tab_info.tab_title
    if title and #title > 0 then
        return title
    end
    return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local raw_title = tab_title(tab)
    local icon = icon_for_title(raw_title)

    local bg_color = "#0f0f16"
    local fg_color = tab.is_active and "#b4befe" or "#7f849c"

    return {
        { Background = { Color = bg_color } },
        { Foreground = { Color = fg_color } },
        { Text = " " .. icon .. " " },
    }
end)

return {
    font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Regular" }),
    font_size = 13.0,
    window_background_opacity = 0.8,
    window_padding = {
        bottom = 0,
    },

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
    show_tab_index_in_tab_bar = false,

    scrollback_lines = 10000,
    adjust_window_size_when_changing_font_size = false,
    audible_bell = "Disabled",
    clean_exit_codes = { 130 },

    color_scheme = "Catppuccin Mocha",

    colors = {
        background = "#0f0f16", -- darker shade of #1E1E2E
    },

    -- replicating compositor/vim like keybindings but with ALT as $mod
    keys = {
        { key = "1", mods = "ALT", action = act.ActivateTab(0) },
        { key = "2", mods = "ALT", action = act.ActivateTab(1) },
        { key = "3", mods = "ALT", action = act.ActivateTab(2) },
        { key = "4", mods = "ALT", action = act.ActivateTab(3) },
        { key = "5", mods = "ALT", action = act.ActivateTab(4) },
        { key = "6", mods = "ALT", action = act.ActivateTab(5) },
        { key = "7", mods = "ALT", action = act.ActivateTab(6) },
        { key = "8", mods = "ALT", action = act.ActivateTab(7) },
        { key = "9", mods = "ALT", action = act.ActivateTab(-1) },

        { key = "Enter", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
        { key = "w", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
        { key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
        { key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },

        { key = "/", mods = "ALT", action = act.Search("CurrentSelectionOrEmptyString") },
        { key = "v", mods = "ALT", action = act.ActivateCopyMode },
    },
}
