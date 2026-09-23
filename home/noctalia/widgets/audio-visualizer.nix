{ config, output }:
{
  box_height = 16.0;
  box_width = 992.0;
  cx = 952.0;
  cy = 1072.0;
  inherit output;
  placement_height = 1080.0;
  placement_width = 1920.0;
  rotation = 0.0;
  type = "audio_visualizer";

  settings = {
    background = false;
    bands = 32;
    centered = true;
    mirrored = true;
    show_when_idle = true;
  };
}
