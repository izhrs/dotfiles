{ pkgs, ... }: {
  # home.packages = with pkgs; [ rust-analyzer rustup ];
  programs.helix = {
    enable = true;
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

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };

        # statusline = {
        #   left = [
        #     "mode"
        #     "spinner"
        #     "file-modification-indicator"
        #     "read-only-indicator"
        #   ];
        #   center = [ "version-control" "file-name" ];
        #   right = [
        #     "diagnostics"
        #     "selections"
        #     "position"
        #     "file-encoding"
        #     "file-line-ending"
        #     "file-type"
        #   ];
        #   separator = "│";
        #   mode = {
        #     normal = "NORMAL";
        #     insert = "INSERT";
        #     select = "SELECT";
        #   };
        # };

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

        insert = { j.k = "normal_mode"; };
      };
    };

    languages = {
      language = [{
        name = "rust";
        auto-format = true;
      }];
    };

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
