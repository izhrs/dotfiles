{ config, output }:
{
  box_height = 70.0;
  box_width = 240.0;
  cx = 960.0;
  cy = 879.0;
  enabled = true;
  inherit output;
  placement_height = 1080.0;
  placement_width = 1920.0;
  rotation = 0.0;
  type = "login_box";

  settings = {
    background_color = "surface_variant";
    background_opacity = 0.0;
    background_radius = 12.0;
    center_password_text = true;
    input_opacity = config.stylix.opacity.desktop;
    input_radius = 32.0;
    layout = "compact";
    show_caps_lock = true;
    show_keyboard_layout = false;
    show_login_button = false;
    show_media = true;
    show_session_buttons = true;
    show_unlock_hint = false;
    show_weather = true;
  };
}
