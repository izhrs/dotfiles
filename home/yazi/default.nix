{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    trash-cli
    ouch

    (writeShellScriptBin "sudofm" ''
      sudo HOME=$HOME XDG_CONFIG_HOME=$HOME/.config EDITOR="hx" yazi "$@"
    '')
  ];

  programs.yazi = {
    enable = true;

    plugins = {
      full-border = pkgs.yaziPlugins.full-border;
      starship = pkgs.yaziPlugins.starship;
      mount = pkgs.yaziPlugins.mount;
      restore = pkgs.yaziPlugins.restore;
      ouch = pkgs.yaziPlugins.ouch;
    };

    initLua = builtins.readFile ./init.lua;

    theme = {
      flavor = {
        light = "catppuccin-latte";
        dark = "catppuccin-mocha";
      };
    };

    flavors = let flav = inputs.yazi-flavors;
    in {
      dracula = "${flav}/dracula";
      catppuccin-macchiato = "${flav}/catppuccin-macchiato.yazi";
      catppuccin-frappe = "${flav}/catppuccin-frappe.yazi";
      catppuccin-latte = "${flav}/catppuccin-latte.yazi";
      catppuccin-mocha = "${flav}/catppuccin-mocha.yazi";
    };

    settings = {
      mgr = {
        # 2/9 width for parent, 3/9 for main, 4/9 for preview
        ratio = [ 2 3 4 ];
        show_hidden = false;
        show_symlink = true;
        sort_by = "mtime";
        sort_reverse = true;
        sort_dirs_first = true;
        linemode = "size_and_mtime";
      };

      plugin = {
        prepend_previewers = [
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
        ];
      };
    };

    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = "M";
            run = "plugin mount";
          }
          {
            on = "u";
            run = "plugin restore";
            desc = "Restore last deleted files/folders";
          }
        ];
      };
    };
  };
}
