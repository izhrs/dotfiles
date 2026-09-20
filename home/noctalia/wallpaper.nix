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
      path = "${wallpaperDir}/a_pixel_nap.png";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/a_pixel_nap_colored.png";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/anime_waifu.png";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/torii_arch.jpg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
  ];
}
