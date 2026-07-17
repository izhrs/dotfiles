{ pkgs, ... }:
{
  xdg.desktopEntries.swayimg = {
    name = "Swayimg";
    genericName = "Image Viewer";
    comment = "A simple image viewer";
    exec = "swayimg %F";
    terminal = false;
    type = "Application";
    icon = "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/kuickshow.svg";
    categories = [
      "Graphics"
      "Viewer"
      "Utility"
    ];
    startupNotify = true;
    mimeType = [
      "image/png"
      "image/jpeg"
      "image/gif"
      "image/webp"
      "image/bmp"
      "image/tiff"
      "image/svg+xml"
      "image/x-xcf"
      "image/vnd.microsoft.icon"
      "image/avif"
      "image/*"
    ];
  };

  programs.swayimg.enable = true;

  xdg.configFile."swayimg/init.lua".text = builtins.readFile ./init.lua;
}
