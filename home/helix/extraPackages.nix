{ pkgs, ... }:

# Binaries for all the Language Servers, Linters and Formatters
with pkgs; [
  lldb
  clang-tools

  # Toml
  taplo

  # typst
  tinymist
  typstyle # formatter

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
  docker-compose-language-service

  # web
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
]
