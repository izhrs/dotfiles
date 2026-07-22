{ pkgs, lib, ... }: {
  imports = [ ./scripts.nix ];

  # I ain't gaining much from stylix here
  # and I dont like the theme it provides
  stylix.targets.helix.enable = false;

  specialisation.light.configuration = {
    programs.helix.settings.theme = lib.mkForce "catppuccin_latte_transparent";
  };

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

        file-picker = {
          hidden = false;
        };
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

  # let yazi handle these files
  home.file.".config/helix/ignore".text = ''
    *.avi
    *.bmp
    *.flac
    *.flv
    *.gif
    *.ico
    *.jpeg
    *.jpg
    *.m4a
    *.mkv
    *.mov
    *.mp3
    *.mp4
    *.ogg
    *.otf
    *.pdf
    *.png
    *.psd
    *.tiff
    *.ttf
    *.wav
    *.webp
    *.woff
    *.woff2
    *.xcf

    node_modules
  '';

  # too short for moving to individual module
  home.packages = with pkgs; [
    nodejs_24
    yarn
    python314
    uv
    docker-compose
    powershell
    typst

    (writeShellScriptBin "edit" ''
      export FILE_TO_EDIT="$1";

      exec kitty --override close_on_child_death=yes -e zellij --layout editor
    '')
  ];

  xdg.desktopEntries.Helix = {
    name = "Helix";
    genericName = "Text Editor";
    comment = "Edit files in Helix running inside Zellij.";
    exec = "edit %F";
    terminal = false;
    type = "Application";
    icon = "helix";
    categories = [
      "Utility"
      "TextEditor"
    ];
    startupNotify = true;
    mimeType = [
      "inode/directory" # open directories
      "text/english"
      "text/plain"
      "text/x-makefile"
      "text/x-c++hdr"
      "text/x-c++src"
      "text/x-chdr"
      "text/x-csrc"
      "text/x-java"
      "text/x-moc"
      "text/x-pascal"
      "text/x-tcl"
      "text/x-tex"
      "application/x-shellscript"
      "text/x-c"
      "text/x-c++"
    ];
  };
}
