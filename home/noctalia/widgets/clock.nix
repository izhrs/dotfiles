{ config, output }:
{
  box_height = 144.0;
  box_width = 240.0;
  cx = 960.0;
  cy = 124.0;
  inherit output;
  placement_height = 1080.0;
  placement_width = 1920.0;
  rotation = 0.0;
  type = "clock";

  settings = {
    background = false;
    shadow = false;
  };
}
