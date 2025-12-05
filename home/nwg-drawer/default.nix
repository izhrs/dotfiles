{ pkgs, ... }: {
  home.packages = with pkgs; [
    nwg-drawer

    (writeShellScriptBin "drawer" ''
      killall nwg-drawer
      nwg-drawer -mb 128 -ml 128 -mr 128 -mt 128 -nocats -nofs -open -term kitty
    '')
  ];

  home.file.".config/nwg-drawer/drawer.css".text = ''
    * {
        color: #cdd6f4;
        border: none;
        transition: all 300ms ease-in-out;
    }

    window {
        border: none;
        background-color: rgba(17, 17, 27, 0.8);
        /* border: solid 1px #313244; */
        border-radius: 10px;
    }

    /* search entry */
    entry {
        background-color: rgba(17, 17, 27, 0); /* transparent */
        color: #cdd6f4;
        border-radius: 10px;
    }

    button,
    image {
        all: unset;
        border-radius: 10px;
        padding: 4px;
        color: #cdd6f4;
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
        background-color: #313244; /* surface0 */
    }

    #pinned-box {
        padding-bottom: 5px;
        border-bottom: 1px dotted #cdd6f4;
    }

    #files-box {
        padding: 5px;
        border: 1px dotted #cdd6f4;
        border-radius: 15px;
    }

    /* math operation result label */
    #math-label {
        font-weight: bold;
        font-size: 16px;
    }
  '';
}
