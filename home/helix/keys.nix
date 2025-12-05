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

      # yazi-picker script defined in ./scripts.nix
      space = [
        # using %% to escape 
        ''
          :sh zellij run -n "" -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- yazi-picker open %{buffer_name}''
        ":redraw"
      ];

      # Override default change picker
      g = [
        ''
          :sh zellij action new-pane --name "" --floating --width 80%% --height 80%% --x 10%% --y 10%% --close-on-exit -- lazygit''
        ":redraw"
      ];

      # serpl is an intutive TUI find and replace tool
      # I don't know which key would make more sense here. using ";" because it's available and ergonomic
      ";" = [
        ''
          :sh zellij action new-pane --name "" --floating --width 80%% --height 80%% --x 10%% --y 10%% --close-on-exit -- serpl''
      ];

      # LLM integration
      # These keybindings launch custom llm-* scripts (defined in ./scripts.nix)
      # inside floating Zellij panes
      l = {
        # chat
        c = [
          ''
            :sh zellij action new-pane --name ""  --floating --width 35%% --height 96%% --x 70%% --y 2%% --close-on-exit -- gemini''
        ];

        # generate commit message
        m = [
          ''
            :sh zellij action new-pane --name ""  --floating --width 35%% --height 96%% --x 70%% --y 2%% --close-on-exit -- llm-gen-commit-msg''
        ];

        # explain the codebase
        e = [
          ''
            :sh zellij action new-pane --name ""  --floating --width 35%% --height 96%% --x 70%% --y 2%% --close-on-exit -- llm-explain''
        ];

        # analyze and suggest improvments
        a = [
          ''
            :sh zellij action new-pane --name ""  --floating --width 35%% --height 96%% --x 70%% --y 2%% --close-on-exit -- llm-do-anal''
        ];
      };

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
