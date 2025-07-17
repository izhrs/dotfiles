{
  programs.bottom = { enable = true; };

  home.file.".local/share/applications/bottom.desktop".text = ''
    [Desktop Entry]
    Name=bottom
    GenericName=System Monitor
    Comment=A customizable cross-platform graphical process/system monitor for the terminal.
    Exec=wezterm -e btm
    Terminal=false
    Type=Application
    Icon=/home/izhrs/.icons/lemon.svg
    Categories=Utility;System;ConsoleOnly;Monitor;
    StartupNotify=false
  '';
}
