{ inputs, pkgs }:
{
  _props = {
    location = "file:${
      inputs.zjstatus.packages.${pkgs.stdenv.hostPlatform.system}.default
    }/bin/zjstatus.wasm";
  };
  _children = [
    {

      hide_frame_for_single_pane = true;
      # hide_frame_except_for_search = true;
      # hide_frame_except_for_fullscreen = true;

      # THIS THEME IS BASED ON: https://github.com/merikan/.dotfiles/blob/main/config/zellij/themes/zjstatus/catppuccin.kdl

      color_rosewater = "#dc8a78";
      color_flamingo = "#dd7878";
      color_pink = "#ea76cb";
      color_mauve = "#8839ef";
      color_red = "#d20f39";
      color_maroon = "#e64553";
      color_peach = "#fe640b";
      color_yellow = "#df8e1d";
      color_green = "#40a02b";
      color_teal = "#179299";
      color_sky = "#04a5e5";
      color_sapphire = "#209fb5";
      color_blue = "#1e66f5";
      color_lavender = "#7287fd";
      color_text = "#11111b";
      color_subtext1 = "#5c5f77";
      color_subtext0 = "#6c6f85";
      color_overlay2 = "#7c7f93";
      color_overlay1 = "#8c8fa1";
      color_overlay0 = "#9ca0b0";
      color_surface2 = "#acb0be";
      color_surface1 = "#bcc0cc";
      color_surface0 = "#ccd0da";
      color_base = "#eff1f5";
      color_mantle = "#e6e9ef";
      color_crust = "#dce0e8";

      format_left = "{mode} {tabs}";
      format_center = "{notifications}";

      # format_right = #[bg=$surface0,fg=$flamingo]#[fg=$crust,bg=$flamingo] #[bg=$surface1,fg=$flamingo,bold] {command_user}@{command_host}#[bg=$surface0,fg=$surface1]
      format_right = "#[fg=$blue]#[bg=$blue,fg=$crust]󰃭 #[bg=$surface1,fg=$blue,bold] {datetime}#[fg=$surface1]";

      # format_space = "#[bg=$surface0]";
      format_hide_on_overlength = true;
      format_precedence = "lrc";

      border_enabled = false;
      border_char = "─";
      border_format = "#[bg=$surface0]{char}";
      border_position = "top";

      mode_normal = "#[fg=$blue]#[bg=$blue,fg=$crust,bold]NORMAL#[fg=$blue]";
      mode_tmux = "#[fg=$mauve]#[bg=$mauve,fg=$crust,bold]TMUX#[fg=$mauve]";
      mode_locked = "#[fg=$red]#[bg=$red,fg=$crust,bold]LOCKED#[fg=$red]";
      mode_pane = "#[fg=$green]#[bg=$green,fg=$crust,bold]PANE#[fg=$green]";
      mode_tab = "#[fg=$teal]#[bg=$teal,fg=$crust,bold]TAB#[fg=$teal]";
      mode_scroll = "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]SCROLL#[fg=$flamingo]";
      mode_enter_search = "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]ENT-SEARCH#[bg=$surfaco,fg=$flamingo]";
      mode_search = "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]SEARCHARCH#[bg=$surfac0,fg=$flamingo]";
      mode_resize = "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]RESIZE#[bg=$surfac0,fg=$yellow]";
      mode_rename_tab = "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]RENAME-TAB#[fg=$yellow]";
      mode_rename_pane = "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]RENAME-PANE#[fg=$yellow]";
      mode_move = "#[fg=$yellow]#[bg=$yellow,fg=$crust,bold]MOVE#[fg=$yellow]";
      mode_session = "#[fg=$pink]#[bg=$pink,fg=$crust,bold]SESSION#[fg=$pink]";
      mode_prompt = "#[fg=$pink]#[bg=$pink,fg=$crust,bold]PROMPT#[fg=$pink]";

      tab_normal = "#[fg=$blue]#[bg=$blue,fg=$crust,bold]{index} #[bg=$surface1,fg=$blue,bold] {name}{floating_indicator}#[fg=$surface1]";
      tab_normal_fullscreen = "#[fg=$blue]#[bg=$blue,fg=$crust,bold]{index} #[bg=$surface1,fg=$blue,bold] {name}{fullscreen_indicator}#[fg=$surface1]";
      tab_normal_sync = "#[fg=$blue]#[bg=$blue,fg=$crust,bold]{index} #[bg=$surface1,fg=$blue,bold] {name}{sync_indicator}#[fg=$surface1]";
      tab_active = "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]{index} #[bg=$surface1,fg=$flamingo,bold] {name}{floating_indicator}#[fg=$surface1]";
      tab_active_fullscreen = "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]{index} #[bg=$surface1,fg=$flamingo,bold] {name}{fullscreen_indicator}#[fg=$surface1]";
      tab_active_sync = "#[fg=$flamingo]#[bg=$flamingo,fg=$crust,bold]{index} #[bg=$surface1,fg=$flamingo,bold] {name}{sync_indicator}#[fg=$surface1]";
      tab_separator = " ";

      tab_sync_indicator = " ";
      tab_fullscreen_indicator = " 󰊓";
      tab_floating_indicator = " 󰹙";

      notification_format_unread = "#[bg=surface0,fg=$yellow]#[bg=$yellow,fg=$crust] #[bg=$surface1,fg=$yellow] {message}#[fg=$yellow]";
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
    }
  ];
}
