{ pkgs, ... }: {
  imports = [ ./scripts.nix ];

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
  ];
}
