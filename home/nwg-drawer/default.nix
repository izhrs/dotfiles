{ config, pkgs, ... }:
let
  base00rgb = "${config.lib.stylix.colors.base00-rgb-r}, ${config.lib.stylix.colors.base00-rgb-g}, ${config.lib.stylix.colors.base00-rgb-b}";
in
{
  home.packages = with pkgs; [
    nwg-drawer

    (writeShellScriptBin "drawer" ''
      killall nwg-drawer
      nwg-drawer -mb 128 -ml 128 -mr 128 -mt 128 -nocats -nofs -open -term kitty
    '')
  ];

  home.file.".config/nwg-drawer/drawer.css" = {
    force = true;
    text = ''
      /* stylix colors */
      * {
          color: #${config.lib.stylix.colors.base05};
          border: none;
          transition: all 300ms ease-in-out;
      }

      window {
          border: none;
          background-color: rgba(${base00rgb}, ${toString config.stylix.opacity.desktop});
          /* border: solid 1px #${config.lib.stylix.colors.base01}; */
          border-radius: 10px;
      }

      /* search entry */
      entry {
          background-color: rgba(${base00rgb}, 0);
          color: #${config.lib.stylix.colors.base05};
          border-radius: 10px;
      }

      button,
      image {
          all: unset;
          border-radius: 10px;
          padding: 4px;
          color: #${config.lib.stylix.colors.base05};
          background: none;
          border: none;
          transition: all 200ms ease-in-out;
      }

      scrollbar slider {
          background: none;
          border: none;
          min-width: 0;
          min-height: 0;
      }

      button {
          border: none;
      }

      button:hover {
          background-color: #${config.lib.stylix.colors.base01};
      }

      #pinned-box {
          padding-bottom: 5px;
          border-bottom: 1px dotted #${config.lib.stylix.colors.base05};
      }

      #files-box {
          padding: 5px;
          border: 1px dotted #${config.lib.stylix.colors.base05};
          border-radius: 15px;
      }

      /* math operation result label */
      #math-label {
          font-weight: bold;
          font-size: 16px;
      }
    '';
  };
}
