{ inputs, pkgs }: {
  _props = {
    location = "file:${
        inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
      }/bin/zjstatus.wasm";
  };
  _children = [{

    hide_frame_for_single_pane = true;
    # hide_frame_except_for_search = true;
    # hide_frame_except_for_fullscreen = true;

    # THIS THEME IS BASED ON: https://github.com/merikan/.dotfiles/blob/main/config/zellij/themes/zjstatus/catppuccin.kdl

    color_rosewater = "#f5e0dc";
    color_flamingo = "#f2cdcd";
    color_pink = "#f5c2e7";
    color_mauve = "#cba6f7";
    color_red = "#f38ba8";
    color_maroon = "#eba0ac";
    color_peach = "#fab387";
    color_yellow = "#f9e2af";
    color_green = "#a6e3a1";
    color_teal = "#94e2d5";
    color_sky = "#89dceb";
    color_sapphire = "#74c7ec";
    color_blue = "#89b4fa";
    color_lavender = "#b4befe";
    color_text = "#cdd6f4";
    color_subtext1 = "#bac2de";
    color_subtext0 = "#a6adc8";
    color_overlay2 = "#9399b2";
    color_overlay1 = "#7f849c";
    color_overlay0 = "#6c7086";
    color_surface2 = "#585b70";
    color_surface1 = "#45475a";
    color_surface0 = "#313244";
    color_base = "#1e1e2e";
    color_mantle = "#181825";
    color_crust = "#11111b";

    format_left = "{mode} {tabs}";
    format_center = "{notifications}";

    # format_right = #[bg=$surface0,fg=$flamingo]#[fg=$crust,bg=$flamingo] #[bg=$surface1,fg=$flamingo,bold] {command_user}@{command_host}#[bg=$surface0,fg=$surface1] 
    format_right =
      "#[fg=$lavender]#[bg=$lavender,fg=$crust]󰃭 #[bg=$surface1,fg=$lavender,bold] {datetime}#[fg=$surface1]";

    # format_space = "#[bg=$surface0]";
    format_hide_on_overlength = true;
    format_precedence = "lrc";

    border_enabled = false;
    border_char = "─";
    border_format = "#[bg=$surface0]{char}";
    border_position = "top";

    mode_normal =
      "#[fg=$lavender]#[bg=$lavender,fg=$crust,bold]NORMAL#[fg=$lavender]";
    mode_tmux = "#[fg=$mauve]#[bg=$mauve,fg=$crust,bold]TMUX#[fg=$mauve]";
    mode_locked = "#[fg=$red]#[bg=$red,fg=$crust,bold]LOCKED#[fg=$red]";
    mode_pane = "#[fg=$green]#[bg=$green,fg=$crust,bold]PANE#[fg=$green]";
    mode_tab = "#[fg=$teal]#[bg=$teal,fg=$crust,bold]TAB#[fg=$teal]";
    mode_scroll =
      "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]SCROLL#[fg=$flamingo]";
    mode_enter_search =
      "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]ENT-SEARCH#[bg=$surfaco,fg=$flamingo]";
    mode_search =
      "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]SEARCHARCH#[bg=$surfac0,fg=$flamingo]";
    mode_resize =
      "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]RESIZE#[bg=$surfac0,fg=$yellow]";
    mode_rename_tab =
      "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]RENAME-TAB#[fg=$yellow]";
    mode_rename_pane =
      "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]RENAME-PANE#[fg=$yellow]";
    mode_move = "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]MOVE#[fg=$yellow]";
    mode_session = "#[fg=$pink]#[bg=$pink,fg=$crust,bold]SESSION#[fg=$pink]";
    mode_prompt = "#[fg=$pink]#[bg=$pink,fg=$crust,bold]PROMPT#[fg=$pink]";

    tab_normal =
      "#[fg=$lavender]#[bg=$lavender,fg=$crust,bold]{index} #[bg=$surface1,fg=$lavender,bold] {name}{floating_indicator}#[fg=$surface1]";
    tab_normal_fullscreen =
      "#[fg=$lavender]#[bg=$lavender,fg=$crust,bold]{index} #[bg=$surface1,fg=$lavender,bold] {name}{fullscreen_indicator}#[fg=$surface1]";
    tab_normal_sync =
      "#[fg=$lavender]#[bg=$lavender,fg=$crust,bold]{index} #[bg=$surface1,fg=$lavender,bold] {name}{sync_indicator}#[fg=$surface1]";
    tab_active =
      "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]{index} #[bg=$surface1,fg=$flamingo,bold] {name}{floating_indicator}#[fg=$surface1]";
    tab_active_fullscreen =
      "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]{index} #[bg=$surface1,fg=$flamingo,bold] {name}{fullscreen_indicator}#[fg=$surface1]";
    tab_active_sync =
      "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]{index} #[bg=$surface1,fg=$flamingo,bold] {name}{sync_indicator}#[fg=$surface1]";
    tab_separator = " ";

    tab_sync_indicator = " ";
    tab_fullscreen_indicator = " 󰊓";
    tab_floating_indicator = " 󰹙";

    notification_format_unread =
      "#[bg=surface0,fg=$yellow]#[bg=$yellow,fg=$crust] #[bg=$surface1,fg=$yellow] {message}#[fg=$yellow]";
    notification_format_no_notifications = "";
    notification_show_interval = "10";

    command_host_command = "uname -n";
    command_host_format = "{stdout}";
    command_host_interval = "0";
    command_host_rendermode = "static";

    command_user_command = "whoami";
    command_user_format = "{stdout}";
    command_user_interval = "10";
    command_user_rendermode = "static";

    datetime = "{format}";
    datetime_format = "%b %d | %I:%M %p";
    datetime_timezone = "Asia/Kolkata";
  }];
}
