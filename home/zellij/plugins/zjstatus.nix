{ pkgs }:
{
  _props = {
    location = "file:${pkgs.zellijPlugins.zjstatus}";
  };
  _children = [
    {

      hide_frame_for_single_pane = true;
      # hide_frame_except_for_search = true;
      # hide_frame_except_for_fullscreen = true;

      # using terminal colors for dynamic theming
      # tuned for m3-tonal-spot color gen
      color_background = 0;
      color_forground = 7;
      color_primary = 2;
      color_secondary = 4;
      color_tertiary = 1;
      color_muted = 8;
      color_muted_forground = 3;

      format_left = "{mode} {tabs}";
      format_center = "{notifications}";

      # format_right = #[bg=$background,fg=$secondary]#[fg=$background,bg=$secondary] #[bg=$background,fg=$secondary,bold] {command_user}@{command_host}#[bg=$background,fg=$background]
      format_right = "#[fg=$primary]#[bg=$primary,fg=$background]󰃭 #[bg=$background,fg=$primary,bold] {datetime}#[fg=$background]";

      # format_space = "#[bg=$background]";
      format_hide_on_overlength = true;
      format_precedence = "lrc";

      border_enabled = false;
      border_char = "─";
      border_format = "#[bg=$background]{char}";
      border_position = "top";

      mode_normal = "#[fg=$primary]#[bg=$primary,fg=$background,bold]NORMAL#[fg=$primary]";
      mode_tmux = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]TMUX#[fg=$secondary]";
      mode_locked = "#[fg=$tertiary]#[bg=$tertiary,fg=$background,bold]LOCKED#[fg=$tertiary]";
      mode_pane = "#[fg=$primary]#[bg=$primary,fg=$background,bold]PANE#[fg=$primary]";
      mode_tab = "#[fg=$muted_forground]#[bg=$muted_forground,fg=$background,bold]TAB#[fg=$muted_forground]";
      mode_scroll = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]SCROLL#[fg=$secondary]";
      mode_enter_search = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]ENT-SEARCH#[bg=$surfaco,fg=$secondary]";
      mode_search = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]SEARCHARCH#[bg=$surfac0,fg=$secondary]";
      mode_session = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]SESSION#[fg=$secondary]";
      mode_prompt = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]PROMPT#[fg=$secondary]";

      tab_normal = "#[fg=$primary]#[bg=$primary,fg=$background,bold]{index} #[bg=$background,fg=$primary,bold] {name}{floating_indicator}#[fg=$background]";
      tab_normal_fullscreen = "#[fg=$primary]#[bg=$primary,fg=$background,bold]{index} #[bg=$background,fg=$primary,bold] {name}{fullscreen_indicator}#[fg=$background]";
      tab_normal_sync = "#[fg=$primary]#[bg=$primary,fg=$background,bold]{index} #[bg=$background,fg=$primary,bold] {name}{sync_indicator}#[fg=$background]";
      tab_active = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]{index} #[bg=$background,fg=$secondary,bold] {name}{floating_indicator}#[fg=$background]";
      tab_active_fullscreen = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]{index} #[bg=$background,fg=$secondary,bold] {name}{fullscreen_indicator}#[fg=$background]";
      tab_active_sync = "#[fg=$secondary]#[bg=$secondary,fg=$background,bold]{index} #[bg=$background,fg=$secondary,bold] {name}{sync_indicator}#[fg=$background]";
      tab_separator = " ";

      tab_sync_indicator = " ";
      tab_fullscreen_indicator = " 󰊓";
      tab_floating_indicator = " 󰹙";
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
