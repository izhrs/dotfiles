{
  home.file = {
    # favourite apps in dock
    ".config/cosmic/com.system76.CosmicAppList" = {
      enable = true;
      source = ./com.system76.CosmicAppList;
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

    # active hint, workspace, natural scroll, tiling
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

    # keybinds
    ".config/cosmic/com.system76.CosmicSettings.Shortcuts" = {
      enable = true;
      source = ./com.system76.CosmicSettings.Shortcuts;
      recursive = true;
      force = true;
    };

    # list of imported images that can be set as wallpapaer
    ".config/cosmic/com.system76.CosmicSettings.Wallpaper" = {
      enable = true;
      source = ./com.system76.CosmicSettings.Wallpaper;
      recursive = true;
      # force = true;
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
}
