{
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = false;

    packages = [
      "io.github.kolunmi.Bazaar" # flatpak app store
      "com.github.tchx84.Flatseal" # GUI flatpak permission manager

      # slop
      "com.jeffser.Alpaca" # gpt-chan

      # stuffs that I rarely use
      "com.github.johnfactotum.Foliate" # ebook reader
      "info.febvre.Komikku" # manga reader
    ];

    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };

    overrides.settings = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];

        # for noctalia/stylix generated themes
        Context.filesystems = [
          "xdg-config/gtk-3.0:ro"
          "xdg-config/gtk-4.0:ro"
        ];
      };
    };
  };
}
