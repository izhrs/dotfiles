{ pkgs, ... }:

{
  home.packages = [ pkgs.inlyne ];

  xdg.mimeApps.defaultApplications = {
    "text/markdown" = [ "inlyne.desktop" ];
  };

  xdg.desktopEntries.inlyne = {
    name = "Inlyne";
    genericName = "Markdown Viewer";
    comment = "a GPU powered, browserless, markdown + html viewer";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/mimetypes/text-markdown.svg";
    exec = "inlyne view %f";
    terminal = false;
    type = "Application";
    mimeType = [ "text/markdown" ];
    categories = [ "Office" "Viewer" ];
  };

  home.file.".config/inlyne/inlyne.toml".text = ''
    theme = "Dark"
    lines-to-scroll = 3.0

    # Dark Theme (Catppuccin Mocha)
    [dark-theme]
    text-color        = 0xcdd6f4
    background-color  = 0x11111b
    code-color        = 0xf5c2e7
    quote-block-color = 0x181825
    link-color        = 0xb4befe
    select-color      = 0x585b70
    checkbox-color    = 0xb4befe
    code-highlighter  = "visual-studio-dark-plus"

    # Light Theme (Catppuccin Latte)
    [light-theme]
    text-color        = 0x4c4f69
    background-color  = 0xeff1f5
    code-color        = 0xdc8a78
    quote-block-color = 0xe6e9ef
    link-color        = 0x7287fd
    select-color      = 0xccd0da
    checkbox-color    = 0x7287fd
    code-highlighter  = "github"

    [font-options]
    monospace-font = "JetBrainsMono NFM"
    regular-font   = "Open Sans"

    [keybindings]
    base = [
      ["ToTop",            ["g", "g"]],
      ["ToBottom",         ["g", "e"]],
      ["PageUp",           ["K"]],
      ["PageDown",         ["J"]],
      ["HistoryNext",      ["l"]],
      ["HistoryPrevious",  ["h"]],
      ["Copy",             ["y"]],
      ["ZoomIn",           ["i"]],
      ["ZoomOut",          ["o"]],
      ["ZoomReset",        ["0"]],
      ["ScrollUp",         ["k"]],
      ["ScrollDown",       ["j"]],
      ["Quit",             ["q"]]
    ]
  '';
}
