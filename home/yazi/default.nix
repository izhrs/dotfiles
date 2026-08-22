{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    trash-cli
    ouch
    glow
    exiftool
  ];

  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;

    plugins = with pkgs.yaziPlugins; {
      full-border = full-border;
      starship = starship;
      mount = mount;
      restore = restore;
      ouch = ouch;
      piper = piper;
      compress = inputs.yazi-compress;
    };

    initLua = builtins.readFile ./init.lua;

    settings = {
      mgr = {
        # 2/9 width for parent, 3/9 for main, 4/9 for preview
        ratio = [
          2
          3
          4
        ];
        show_hidden = false;
        show_symlink = true;
        sort_by = "natural";
        sort_reverse = false;
        sort_dirs_first = true;
        linemode = "size_and_mtime";
      };

      plugin = {
        prepend_previewers = [
          # directory previewer
          {
            url = "*/";
            run = ''piper -- eza -TL=2 --color=always --icons=always --group-directories-first --no-quotes -a "$1"'';
          }

          # archive previewers
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/x-tar";
            run = "ouch";
          }
          {
            mime = "application/x-bzip2";
            run = "ouch";
          }
          {
            mime = "application/x-7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/x-rar";
            run = "ouch";
          }
          {
            mime = "application/x-xz";
            run = "ouch";
          }
          {
            mime = "application/xz";
            run = "ouch";
          }

          # markdown with glow
          {
            url = "*.md";
            run = ''
              piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dark "$1"
            '';
          }

          {
            url = "*.csv";
            run = ''piper -- bat -p --color=always "$1"'';
          }
        ];
      };
    };

    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = "M";
            run = "plugin mount";
            desc = "Mount drives";
          }

          {
            on = "u";
            run = "plugin restore";
            desc = "Restore last deleted files/folders";
          }

          # compress.yazi
          {
            on = [
              "-"
              "c"
            ];
            run = "plugin compress";
            desc = "Archive selected files";
          }
          {
            on = [
              "-"
              "p"
            ];
            run = "plugin compress -p";
            desc = "Archive with password";
          }
          {
            on = [
              "-"
              "h"
            ];
            run = "plugin compress -ph";
            desc = "Archive with password and header";
          }
          {
            on = [
              "-"
              "l"
            ];
            run = "plugin compress -l";
            desc = "Archive with compression level";
          }
        ];
      };
    };
  };
}
