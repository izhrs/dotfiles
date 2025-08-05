{ pkgs, ... }: {
  home.file.".gemini/settings.json".text = builtins.toJSON {
    hideTips = true;
    hideBanner = true;
    preferredEditor = "hx";
    vimMode = true;
    usageStatisticsEnabled = false;
    theme = "Default";
    selectedAuthType = "oauth-personal";
    includeDirectories = [ "~/.gemini" ];
  };

  home.packages = with pkgs; [ gemini-cli ];
}
