{
  layout = {
    _children = [
      {
        tab = {
          _props = {
            name = "EDITOR";
          };
          _children = [
            {
              pane = {
                _props = {
                  name = "";
                  borderless = true;
                  edit = "$FILE_TO_EDIT";
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
    ];
  };
}
