{
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = false;

    packages = [
      "com.github.tchx84.Flatseal" # GUI flatpak permission manager
      "net.nokyan.Resources"
      "org.gnome.Snapshot"

      # Communication
      "org.gnome.Evolution" # email client
      "me.proton.Mail"

      # slop
      "com.jeffser.Alpaca"
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
