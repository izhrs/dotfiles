{ pkgs, ... }: {
  home.packages = with pkgs; [
    tela-circle-icon-theme

    (writeShellScriptBin "rofi-launcher" ''
      if pgrep -x rofi; then
        pkill -x rofi
        exit
      fi
      rofi -show drun -show-icons 
    '')
  ];

  xdg.mimeApps.defaultApplications = {
    "video/*" = [ "com.system76.CosmicPlayer.desktop" ];
  };

  home.file = {
    # favourite apps in dock
    ".config/cosmic/com.system76.CosmicAppList" = {
      enable = true;
      source = ./com.system76.CosmicAppList;
      recursive = true;
      force = true;
    };

    # keybinds
    ".config/cosmic/com.system76.CosmicSettings.Shortcuts" = {
      enable = true;
      source = ./com.system76.CosmicSettings.Shortcuts;
      recursive = true;
      force = true;
    };

    #wallpaper
    ".config/cosmic/com.system76.CosmicBackground" = {
      enable = true;
      source = ./com.system76.CosmicBackground;
      recursive = true;
      # force = true;
    };

    # list of imported images that can be set as wallpapaer
    ".config/cosmic/com.system76.CosmicSettings.Wallpaper" = {
      enable = true;
      source = ./com.system76.CosmicSettings.Wallpaper;
      recursive = true;
      # force = true;
    };

    # active hint, workspace, natural scroll, tiling, pinned workspace
    ".config/cosmic/com.system76.CosmicComp" = {
      enable = true;
      source = ./com.system76.CosmicComp;
      recursive = true;
      force = true;
    };

    # power saver, suspend timeout
    ".config/cosmic/com.system76.CosmicIdle" = {
      enable = true;
      source = ./com.system76.CosmicIdle;
      recursive = true;
      force = true;
    };

    # list of enabled panel and dock
    ".config/cosmic/com.system76.CosmicPanel" = {
      enable = true;
      source = ./com.system76.CosmicPanel;
      recursive = true;
      force = true;
    };

    # dock padding and style
    ".config/cosmic/com.system76.CosmicPanel.Dock" = {
      enable = true;
      source = ./com.system76.CosmicPanel.Dock;
      recursive = true;
      force = true;
    };

    # panel applet positions, style,and animations 
    ".config/cosmic/com.system76.CosmicPanel.Panel" = {
      enable = true;
      source = ./com.system76.CosmicPanel.Panel;
      recursive = true;
      force = true;
    };

    # what's this for??
    ".config/cosmic/com.system76.CosmicPanelButton" = {
      enable = true;
      source = ./com.system76.CosmicPanelButton;
      recursive = true;
      force = true;
    };

    # file manager
    ".config/cosmic/com.system76.CosmicFiles" = {
      enable = true;
      source = ./com.system76.CosmicFiles;
      recursive = true;
      force = true;
    };

    # dark colors, theme and pallete
    ".config/cosmic/com.system76.CosmicTheme.Dark" = {
      enable = true;
      source = ./com.system76.CosmicTheme.Dark;
      recursive = true;
      force = true;
    };

    ".config/cosmic/com.system76.CosmicTheme.Dark.Builder" = {
      enable = true;
      source = ./com.system76.CosmicTheme.Dark.Builder;
      recursive = true;
      force = true;
    };

    # light colors, theme and pallete
    ".config/cosmic/com.system76.CosmicTheme.Light" = {
      enable = true;
      source = ./com.system76.CosmicTheme.Light;
      recursive = true;
      force = true;
    };

    ".config/cosmic/com.system76.CosmicTheme.Light.Builder" = {
      enable = true;
      source = ./com.system76.CosmicTheme.Light.Builder;
      recursive = true;
      force = true;
    };

    # icons
    ".config/cosmic/com.system76.CosmicTk" = {
      enable = true;
      source = ./com.system76.CosmicTk;
      recursive = true;
      force = true;
    };
  };

  # Below entries are only for sake of customizing desktop icons because most of icon pack do not provide cosmic icons
  # Multiple desktop entries won't cause any problem; Launchers will pick these over default desktop entries
  xdg.desktopEntries."com.system76.CosmicSettings" = {
    name = "COSMIC Settings";
    genericName = "System Settings";
    comment = "Configure and customize the COSMIC desktop environment.";
    exec = "cosmic-settings";
    terminal = false;
    type = "Application";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/preferences-system.svg";
    categories = [ "COSMIC" ];
    startupNotify = true;
  };

  xdg.desktopEntries."com.system76.CosmicFiles" = {
    name = "COSMIC Files";
    genericName = "File Manager";
    comment = "Browse and manage files in the COSMIC desktop environment.";
    exec = "cosmic-files %U";
    terminal = false;
    type = "Application";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/file-manager.svg";
    categories = [ "COSMIC" "Utility" "FileManager" ];
    startupNotify = true;
    mimeType = [ "inode/directory" ];
  };

  xdg.desktopEntries."com.system76.CosmicWorkspaces" = {
    name = "Workspaces";
    genericName = "Workspace Manager";
    comment = "Manage virtual workspaces in the COSMIC desktop environment.";
    exec = "cosmic-workspaces";
    terminal = false;
    type = "Application";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/pop-cosmic-workspaces.svg";
    categories = [ "COSMIC" ];
    startupNotify = true;
    noDisplay = true;
  };

  xdg.desktopEntries."dev.edfloreshz.Calculator" = {
    name = "Calculator";
    genericName = "Calculator";
    comment = "A simple calculator.";
    exec = "cosmic-ext-calculator %F";
    terminal = false;
    type = "Application";
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/calc.svg";
    categories = [ "COSMIC" "Utility" ];
    startupNotify = true;
    mimeType = [ "inode/directory" ];
  };

  xdg.desktopEntries."com.system76.CosmicPlayer" = {
    name = "COSMIC Media Player";
    exec = "cosmic-player %U";
    type = "Application";
    startupNotify = true;
    icon =
      "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/totem.svg";
    categories = [ "COSMIC" "AudioVideo" "Player" "Video" ];
    mimeType = [
      "application/mxf"
      "application/ram"
      "application/sdp"
      "application/vnd.apple.mpegurl"
      "application/vnd.ms-asf"
      "application/vnd.ms-wpl"
      "application/vnd.rn-realmedia"
      "application/vnd.rn-realmedia-vbr"
      "application/x-extension-m4a"
      "application/x-extension-mp4"
      "application/x-flash-video"
      "application/x-matroska"
      "application/x-netshow-channel"
      "application/x-quicktimeplayer"
      "application/x-shorten"
      "image/vnd.rn-realpix"
      "image/x-pict"
      "misc/ultravox"
      "text/x-google-video-pointer"
      "video/3gp"
      "video/3gpp"
      "video/3gpp2"
      "video/dv"
      "video/divx"
      "video/fli"
      "video/flv"
      "video/mp2t"
      "video/mp4"
      "video/mp4v-es"
      "video/mpeg"
      "video/mpeg-system"
      "video/msvideo"
      "video/ogg"
      "video/quicktime"
      "video/vivo"
      "video/vnd.divx"
      "video/vnd.mpegurl"
      "video/vnd.rn-realvideo"
      "video/vnd.vivo"
      "video/webm"
      "video/x-anim"
      "video/x-avi"
      "video/x-flc"
      "video/x-fli"
      "video/x-flic"
      "video/x-flv"
      "video/x-m4v"
      "video/x-matroska"
      "video/x-mjpeg"
      "video/x-mpeg"
      "video/x-mpeg2"
      "video/x-ms-asf"
      "video/x-ms-asf-plugin"
      "video/x-ms-asx"
      "video/x-msvideo"
      "video/x-ms-wm"
      "video/x-ms-wmv"
      "video/x-ms-wmx"
      "video/x-ms-wvx"
      "video/x-nsv"
      "video/x-ogm+ogg"
      "video/x-theora"
      "video/x-theora+ogg"
      "video/x-totem-stream"
      "audio/x-pn-realaudio"
      "application/smil"
      "application/smil+xml"
      "application/x-quicktime-media-link"
      "application/x-smil"
      "text/google-video-pointer"
      "x-content/video-dvd"
      "x-scheme-handler/pnm"
      "x-scheme-handler/mms"
      "x-scheme-handler/net"
      "x-scheme-handler/rtp"
      "x-scheme-handler/rtmp"
      "x-scheme-handler/rtsp"
      "x-scheme-handler/mmsh"
      "x-scheme-handler/uvox"
      "x-scheme-handler/icy"
      "x-scheme-handler/icyx"
    ];
  };

}
