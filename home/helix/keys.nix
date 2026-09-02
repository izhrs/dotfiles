{
  normal = {
    esc = [
      "collapse_selection"
      "keep_primary_selection"
    ];
    "{" = "goto_prev_paragraph";
    "}" = "goto_next_paragraph";
    H = "goto_previous_buffer";
    L = "goto_next_buffer";

    space = {
      w = ":w";
      q = ":q";

      # it's easier than C-i and C-o for me
      i = "jump_forward";
      o = "jump_backward";

      # toggles
      t = {
        s = ":toggle-option soft-wrap.enable";
        u = "switch_case";
      };

      # yazi-picker script defined in ./scripts.nix
      space = [
        # using %% to escape
        '':sh zellij run -n "" -c -f -x 5%% -y 5%% --width 90%% --height 90%% --close-on-exit --block-until-exit -- yazi-picker open %{buffer_name}''
        ":redraw"
      ];

      # Override default change picker
      g = [
        '':sh zellij action new-pane --name "" --floating --width 90%% --height 90%% --x 5%% --y 5%% --close-on-exit --block-until-exit -- lazygit''
        ":redraw"
      ];

      # serpl is an intutive TUI find and replace tool
      # I don't know which key would make more sense here. using ";" because it's available and ergonomic
      ";" = [
        '':sh zellij action new-pane --name "" --floating --width 90%% --height 90%% --x 5%% --y 5%% --close-on-exit --block-until-exit -- serpl''
      ];
    };

    m.w = "select_all";
  };

  select = {
    "{" = "goto_prev_paragraph";
    "}" = "goto_next_paragraph";
    space = {
      # it's easier than C-i and C-o for me
      i = "jump_forward";
      o = "jump_backward";

      # toggles
      t = {
        s = ":toggle-option soft-wrap.enable";
        u = "switch_case";
      };
    };

    m.w = "select_all";
  };

  insert = {
    C-space = "completion";
  };
}
