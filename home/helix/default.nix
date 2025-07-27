{ pkgs, ... }: {
  programs.helix = {
    enable = true;

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
      pyright
      black

      # Bash / Shell
      bash-language-server
      shfmt

      # Docker
      dockerfile-language-server-nodejs
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

      # Markdown
      markdown-oxide
    ];

    settings = {
      theme = "catppuccin_mocha_transparent";
      editor = {
        # scrollPastEnd = true;
        text-width = 80;
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        inline-diagnostics.cursor-line = "warning";
        end-of-line-diagnostics = "hint";

        popup-border = "all";

        file-picker = { hidden = false; };

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };

        statusline = {
          left = [
            "mode"
            "file-name"
            "version-control"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          center = [ ];
          right = [
            "spinner"
            "file-type"
            "diagnostics"
            "selections"
            "register"
            "position-percentage"
            "position"
            "file-encoding"
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
          space.space = "file_picker";
          space.w = ":w";
          space.q = ":q";
          G = "goto_last_line";
          esc = [ "collapse_selection" "keep_primary_selection" ];
          "{" = "goto_prev_paragraph";
          "}" = "goto_next_paragraph";
        };

        select = { G = "goto_last_line"; };

        insert = { C-space = "completion"; };
      };
    };

    languages = import ./language.nix;

    themes = {
      catppuccin_mocha_transparent = {
        inherits = "catppuccin_mocha";
        "ui.background" = { };
        "ui.popup" = { };
        "ui.virtual.inlay-hint" = { fg = "#6c7086"; };
      };
    };
  };
}
