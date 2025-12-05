{ pkgs, ... }: {
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
