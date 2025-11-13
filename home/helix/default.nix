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

      keys = import ./keys.nix;
    };

    languages = import ./language.nix { inherit pkgs; };

    themes = import ./theme.nix;

    extraPackages = import ./extraPackages.nix { inherit pkgs; };
  };

  home.packages = with pkgs; [
    nodejs_24
    yarn
    python314
    uv
    docker-compose
    powershell

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

    (writeShellScriptBin "llm-gen-commit-msg" ''
      gemini --yolo --prompt-interactive "
      Write a Git commit message for staged changes.

      - Match the existing commit style if possible.
      - If unclear, use Conventional Commit format: feat|fix|chore|refactor(scope): summary.
      - Keep under 72 chars; add a short body if useful.
      - Do not edit files — only output the commit message.
      "
    '')

    (writeShellScriptBin "llm-do-anal" ''
      gemini --yolo --prompt-interactive "
      Review the current codebase and suggest improvements.

      Identify design, performance, or readability issues.
      Be specific: reference files or functions.
      Output recommendations only; do not edit files.
      "
    '')

    (writeShellScriptBin "llm-explain" ''
      gemini --yolo --prompt-interactive "
      Explain the codebase for a new developer.

      Summarize structure, key modules, and interactions.
      Focus on clarity and accuracy.
      Output only your explanation; do not edit files.
      "
    '')
  ];
}
