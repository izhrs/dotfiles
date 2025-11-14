{ lib, pkgs, inputs, ... }: {

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
                  borderless = false;
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

    # this is slightly modified official catppuccin theme
    # just replaced green with lavender
    # IDK why I have to specify this twice
    themes = {
      # this is file name and this can be anything
      catppuccin = {
        # contents of file
        themes = {
          # theme name (this must be used to set theme)
          catppuccin-mocha-lavender = {

            text_unselected = {
              base = [ 205 214 244 ];
              background = [ 24 24 37 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            text_selected = {
              base = [ 205 214 244 ];
              background = [ 88 91 112 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            ribbon_selected = {
              base = [ 24 24 37 ];
              background = [ 180 190 254 ]; # changed to lavender
              emphasis_0 = [ 243 139 168 ];
              emphasis_1 = [ 250 179 135 ];
              emphasis_2 = [ 245 194 231 ];
              emphasis_3 = [ 137 180 250 ];
            };

            ribbon_unselected = {
              base = [ 24 24 37 ];
              background = [ 205 214 244 ];
              emphasis_0 = [ 243 139 168 ];
              emphasis_1 = [ 205 214 244 ];
              emphasis_2 = [ 137 180 250 ];
              emphasis_3 = [ 245 194 231 ];
            };

            table_title = {
              base = [ 180 190 254 ]; # changed to lavender
              background = [ 0 0 0 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            table_cell_selected = {
              base = [ 205 214 244 ];
              background = [ 88 91 112 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            table_cell_unselected = {
              base = [ 205 214 244 ];
              background = [ 24 24 37 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            list_selected = {
              base = [ 205 214 244 ];
              background = [ 88 91 112 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            list_unselected = {
              base = [ 205 214 244 ];
              background = [ 24 24 37 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 180 190 254 ]; # changed to lavender
              emphasis_3 = [ 245 194 231 ];
            };

            frame_selected = {
              base = [ 180 190 254 ]; # changed to lavender
              background = [ 0 0 0 ];
              emphasis_0 = [ 250 179 135 ];
              emphasis_1 = [ 137 220 235 ];
              emphasis_2 = [ 245 194 231 ];
              emphasis_3 = [ 0 0 0 ];
            };

            frame_highlight = {
              base = [ 250 179 135 ];
              background = [ 0 0 0 ];
              emphasis_0 = [ 245 194 231 ];
              emphasis_1 = [ 250 179 135 ];
              emphasis_2 = [ 250 179 135 ];
              emphasis_3 = [ 250 179 135 ];
            };

            exit_code_success = {
              base = [ 180 190 254 ]; # changed to lavender
              background = [ 0 0 0 ];
              emphasis_0 = [ 137 220 235 ];
              emphasis_1 = [ 24 24 37 ];
              emphasis_2 = [ 245 194 231 ];
              emphasis_3 = [ 137 180 250 ];
            };

            exit_code_error = {
              base = [ 243 139 168 ];
              background = [ 0 0 0 ];
              emphasis_0 = [ 249 226 175 ];
              emphasis_1 = [ 0 0 0 ];
              emphasis_2 = [ 0 0 0 ];
              emphasis_3 = [ 0 0 0 ];
            };

            multiplayer_user_colors = {
              player_1 = [ 245 194 231 ];
              player_2 = [ 137 180 250 ];
              player_3 = [ 0 0 0 ];
              player_4 = [ 249 226 175 ];
              player_5 = [ 137 220 235 ];
              player_6 = [ 0 0 0 ];
              player_7 = [ 243 139 168 ];
              player_8 = [ 0 0 0 ];
              player_9 = [ 0 0 0 ];
              player_10 = [ 0 0 0 ];
            };
          };
        };
      };
    };
  };
}
