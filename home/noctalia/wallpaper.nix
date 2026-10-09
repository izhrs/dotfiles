{ config, ... }:
let
  wallpaperDir = ../../wallpapers;
in
{
  enabled = true;
  default.path = config.stylix.image;

  # defaults
  directory = wallpaperDir;

  # for wallpaper management without rebuild
  directory_dark = "${config.xdg.userDirs.pictures}/wallpapers/dark";
  directory_light = "${config.xdg.userDirs.pictures}/wallpapers/light";

  transition = [
    "disc"
    "honeycomb"
  ];
  transition_on_startup = true;

  automation.enabled = false;

  favorite = [
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/pixel_nap_dark.png";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/pixel_nap_light.png";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/tsukatsuki_rio_dark.jpeg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/tsukatsuki_rio_light.jpeg";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
  ];
}
