{ config, ... }:
let
  wallpaperDir = ../../wallpapers;
in
{
  enabled = true;
  default.path = config.stylix.image;

  directory = wallpaperDir;

  transition = [
    "disc"
    "honeycomb"
  ];

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
      path = "${wallpaperDir}/blue_siren.png";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/cabin.jpg";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/dark_sky.png";
      theme_mode = "dark";
      wallpaper_scheme = "m3-content";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/fantasy_woods.jpg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/grass.png";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/green_stairs.jpg";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/japan3.jpg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/marin_kitagawa.jpg";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/railroad_cat.png";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/reze.jpg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/stop.jpg";
      theme_mode = "light";
      wallpaper_scheme = "m3-content";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/street.png";
      theme_mode = "dark";
      wallpaper_scheme = "m3-content";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/susume_door.png";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/temple_sky.jpg";
      theme_mode = "light";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/torii_arch.jpg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/towashi.png";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
    {
      palette_source = "wallpaper";
      path = "${wallpaperDir}/water_princess.jpg";
      theme_mode = "dark";
      wallpaper_scheme = "m3-tonal-spot";
    }
  ];
}
