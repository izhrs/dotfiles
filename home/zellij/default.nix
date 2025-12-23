{ lib, pkgs, inputs, ... }: {

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      theme = "catppuccin-mocha-lavender";
      copy_command = "wl-copy";
      mouse_mode = false;

      show_startup_tips = false;
      show_release_notes = false;
      ui = {
        pane_frames = {
          rounded_corners = true;
          hide_session_name = true;
        };
      };

      plugins = {
        zjstatus = import ./plugins/zjstatus.nix { inherit inputs pkgs; };
      };

    };

    layouts = {
      default = {
        layout = {
          _children = [
            {
              pane = {
                _props = {
                  name = "";
                  # borderless = true; let zjstatus handle it
                };
              };
            }
            {
              pane = {
                _props = {
                  size = 1;
                  borderless = true;
                };
                _children = [{ plugin = { location = "zjstatus"; }; }];
              };
            }
          ];
        };
      };
    };

    themes = import ./themes.nix;
  };

  # zellij's auto tab renaming 

  # lib.mkAfter means “append this Zsh configuration to the end of the specified
  # config file”, which in this case is .zshrc.
  # This config can be done in ../shell/default.nix too, but it's better here
  # It's same as enableZshIntegration but custom
  programs.zsh.initContent = lib.mkAfter ''
    function zellij_tab_name_update() {
      if [[ -n $ZELLIJ ]]; then
        current_dir=$PWD

        case "$current_dir" in
          "$HOME")            current_dir=" " ;;
          "$HOME/Downloads")  current_dir=" " ;;
          "$HOME/Music")      current_dir=" " ;;
          "$HOME/Pictures")   current_dir=" " ;;
          "$HOME/Videos")     current_dir=" " ;;
          "$HOME/Documents")  current_dir=" " ;;
          "$HOME/Documents/code")  current_dir=" " ;;
          "$HOME/Documents/code/dotfiles")   current_dir="󱄅 " ;; # you would want to change this
          *)
            current_dir=''${current_dir##*/}
            ;;
        esac

        command nohup zellij action rename-tab "$current_dir" >/dev/null 2>&1
      fi
    }

    zellij_tab_name_update
    autoload -Uz add-zsh-hook
    add-zsh-hook chpwd zellij_tab_name_update'';

  home.packages = with pkgs;
    [
      (writeShellScriptBin "llm" ''
        zellij action new-pane --name ""  --floating --width 35% --height 96% --x 70% --y 2% --close-on-exit -- gemini
      '')
    ];
}
