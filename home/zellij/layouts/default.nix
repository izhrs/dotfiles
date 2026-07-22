{
  layout = {
    _children = [
      {
        pane = {
          _props = {
            name = "";
            borderless = true;
          };
        };
      }
      {
        pane = {
          _props = {
            size = 1;
            borderless = true;
          };
          _children = [
            {
              plugin = {
                location = "zjstatus";
              };
            }
          ];
        };
      }
    ];
  };
}
