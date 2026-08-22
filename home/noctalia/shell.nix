{ config }: {
  corner_radius_scale = 1.0;
  button_borders = false;
  input_borders = false;
  popup_borders = false;
  popup_shadows = false;
  font_family = config.stylix.fonts.serif.name;
  lang = "en";
  time_format = "{:%-I:%M}";
  date_format = "%A, %x";
  offline_mode = false;
  external_ip_enabled = false;
  telemetry_enabled = false;
  setup_wizard_enabled = true;
  polkit_agent = true;
  password_style = "random";

  panel = {
    borders = false;
    shadow = false;

    clipboard_placement = "attached";
    open_near_click_clipboard = true;
  };

  greeter_sync = {
    auto_sync = false;
    privilege_command = "kitty -e pkexec";
  };
}
