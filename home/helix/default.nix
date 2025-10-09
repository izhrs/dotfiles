{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha_transparent";
      editor = {
        # scrollPastEnd = true;
        text-width = 80;
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        soft-wrap.enable = false;

        inline-diagnostics.cursor-line = "warning";
        end-of-line-diagnostics = "hint";

        popup-border = "all";
        color-modes = true;

        file-picker = { hidden = false; };
        bufferline = "multiple";

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };

        statusline = {
          left = [
            "mode"
            "file-name"
            "diagnostics"
            "version-control"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          center = [ ];
          right = [
            "register"
            "file-type"
            "file-encoding"
            "selections"
            "position"
            "position-percentage"
            "spinner"
          ];
          separator = "│";
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        indent-guides = {
          render = true;
          character = "▏";
        };
      };

      keys = {
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
        };

        insert = { C-space = "completion"; };
      };
    };

    languages = import ./language.nix { inherit pkgs; };

    themes = {
      catppuccin_mocha_transparent = {
        inherits = "catppuccin_mocha";
        "ui.background" = { };
        "ui.popup" = { };
        "ui.virtual.inlay-hint" = { fg = "#6c7086"; };
      };
    };

    extraPackages = with pkgs; [
      lldb_20

      # Toml
      taplo

      # Yaml
      yaml-language-server

      # Nix
      nixd
      nixfmt-classic

      # Lua
      stylua
      lua-language-server

      # Python
      ruff
      ty

      # Bash / Shell
      bash-language-server
      shfmt

      # Docker
      dockerfile-language-server
      dockfmt

      # Frontend
      # vscode-css-language-server vscode-eslint-language-server vscode-html-language-server
      # vscode-json-language-server vscode-markdown-language-server
      vscode-langservers-extracted
      emmet-ls

      typescript-language-server
      tailwindcss-language-server
      svelte-language-server
      prettier

      # PostgreSQL
      pgformatter

      # Powershell
      powershell-editor-services # powershell pkg in system/configuration.nix

      # Markdown
      markdown-oxide
    ];
  };

  home.packages = with pkgs; [
    # got this script from: https://yazi-rs.github.io/docs/tips/#helix-with-zellij
    (writeShellScriptBin "yazi-picker" ''
      paths=$(yazi "$2" --chooser-file=/dev/stdout | while read -r; do printf "%q " "$REPLY"; done)

      if [[ -n "$paths" ]]; then
      	zellij action toggle-floating-panes
      	zellij action write 27 # send <Escape> key
      	zellij action write-chars ":$1 $paths"
      	zellij action write 13 # send <Enter> key
      else
      	zellij action toggle-floating-panes
      fi
    '')

    # Development tools 
    rustup
    gcc
    musl
    nodejs_24
    python314
    uv # python package manager
    docker-compose
    powershell
  ];
}
