{
  normal = {
    esc = [ "collapse_selection" "keep_primary_selection" ];
    "{" = "goto_prev_paragraph";
    "}" = "goto_next_paragraph";
    H = "goto_previous_buffer";
    L = "goto_next_buffer";

    space = {
      w = ":w";
      q = ":q";
      u = "switch_to_lowercase";
      U = "switch_to_uppercase";

      # yazi-picker script defined at bottom of this file
      space = [
        # using %% to escape 
        ''
          :sh zellij run -n "" -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- yazi-picker open %{buffer_name}''
        ":redraw"
      ];
      l = [
        ''
          :sh zellij action new-pane --name "" --floating --width 80%% --height 80%% --x 10%% --y 10%% --close-on-exit -- lazygit''
        ":redraw"
      ];

      t = {
        s = ":toggle-option soft-wrap.enable";
        u = "switch_case";
      };
    };

    C-y = {
      y = ''
        :sh zellij run -n "" -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- yazi-picker open %{buffer_name}'';
      # Open the file(s) in a vertical split
      v = ''
        :sh zellij run -n "" -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- yazi-picker vsplit %{buffer_name}'';
      # Open the file(s) in a horizontal split
      h = ''
        :sh zellij run -n "" -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- yazi-picker hsplit %{buffer_name}'';
    };

    m.w = "select_all";
  };

  select = {
    "{" = "goto_prev_paragraph";
    "}" = "goto_next_paragraph";
    space = {
      u = "switch_to_lowercase";
      U = "switch_to_uppercase";

      t = {
        s = ":toggle-option soft-wrap.enable";
        u = "switch_case";
      };
    };

    m.w = "select_all";
  };

  insert = { C-space = "completion"; };
}
