{
  programs.zellij = {
    enable = true;

    settings = {
      theme = "catppuccin-mocha";
      themes.catppuccin-mocha.pane_border_focused = "#b57edc";

      show_startup_tips = false;
      show_release_notes = false;
      ui = {
        pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };
    };

    # layouts = {
    #   default = {
    #     layout = {
    #       direction = "vertical";
    #       parts = [{
    #         direction = "horizontal";
    #         parts = [{ command = "zsh"; }];
    #       }];
    #     };
    #   };
    # };
  };
}
