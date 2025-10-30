{ pkgs, ... }: {
  home.file.".gemini/settings.json".text = builtins.toJSON {
    ui = {
      hideTips = true;
      hideBanner = true;
      theme = "Default";
    };

    context = { includeDirectories = [ "~/.gemini" ]; };

    general = {
      preferredEditor = "hx";
      vimMode = true;
    };

    security = { auth = { selectedType = "oauth-personal"; }; };

    privacy = { usageStatisticsEnabled = false; };
  };

  home.packages = with pkgs; [ gemini-cli ];
}
