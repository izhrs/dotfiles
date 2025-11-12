{ pkgs, ... }: {
  home.file.".gemini/settings.json".text = builtins.toJSON {
    ui = {
      hideTips = true;
      hideBanner = true;
      hideWindowTitle = true;
      useFullWidth = true;
      showMemoryUsage = true;
      theme = "Default";

      footer = {
        hideCWD = true;
        hideSandboxStatus = true;
        hideContextPercentage = true;
      };
    };

    context = { includeDirectories = [ "~/.gemini" ]; };

    general = {
      preferredEditor = "hx";
      vimMode = true;
      disableAutoUpdate = true;
      disableUpdateNag = true;
      enablePromptCompletion = true;
    };

    security = { auth = { selectedType = "oauth-personal"; }; };

    privacy = { usageStatisticsEnabled = false; };
  };

  home.packages = with pkgs; [ gemini-cli ];
}
