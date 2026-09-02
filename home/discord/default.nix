{ pkgs, ... }: {
  stylix.targets.vencord.enable = false;
  stylix.targets.vesktop.enable = false;

  programs.vesktop = {
    enable = true;

    settings = {
      hardwareAcceleration = true;

      checkUpdates = false;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = false;
    };

    vencord.settings = {
      enabledThemes = [
        "discord-system24.css"
      ];

      useSystem = true;
      autoUpdate = false;
      autoUpdateNotification = false;
      disableMinSize = true;
      notifyAboutUpdates = false;

      plugins = {
        FakeNitro.enabled = true;
        MessageLogger.enabled = true;
      };
    };
  };

  xdg.desktopEntries.vesktop = {
    name = "Discord";
    genericName = "Internet Messenger";
    exec = "vesktop %U";
    icon = "${pkgs.colloid-icon-theme}/share/icons/Colloid/apps/scalable/discord.svg";
    type = "Application";
    categories = [
      "Network"
      "InstantMessaging"
      "Chat"
    ];
    mimeType = [ "x-scheme-handler/discord" ];
    settings = {
      Keywords = "discord;vencord;electron;chat";
      StartupWMClass = "Discord";
      Version = "1.5";
    };
  };
}
