{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      show_startup_tips = false;
      show_release_notes = false;
      ui = {
        pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
    };
  };
}
