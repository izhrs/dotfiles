{ pkgs, inputs, ... }: {
  programs.yazi = {
    enable = true;

    plugins = {
      full-border = pkgs.yaziPlugins.full-border;
      starship = pkgs.yaziPlugins.starship;
    };

    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()

      function Linemode:size_and_mtime()
          local time = math.floor(self._file.cha.mtime or 0)
          if time == 0 then
              time = ""
          elseif os.date("%Y", time) == os.date("%Y") then
              time = os.date("%b %d %H:%M", time)
          else
              time = os.date("%b %d  %Y", time)
          end

          local size = self._file:size()
          return string.format("%s %s", size and ya.readable_size(size) or "dir", time)
      end
    '';

    theme = {
      flavor = {
        light = "catppuccin-latte";
        dark = "catppuccin-mocha";
      };
    };

    flavors = let flav = inputs.yazi-flavors;
    in {
      dracula = "${flav}/dracula";
      catppuccin-macchiato = "${flav}/catppuccin-macchiato.yazi";
      catppuccin-frappe = "${flav}/catppuccin-frappe.yazi";
      catppuccin-latte = "${flav}/catppuccin-latte.yazi";
      catppuccin-mocha = "${flav}/catppuccin-mocha.yazi";
    };

    settings = {
      manager = {
        # 2/9 width for parent, 4/9 for main, 3/9 for preview
        ratio = [ 2 4 3 ];
        show_hidden = false;
        show_symlink = true;
        sort_by = "mtime";
        sort_reverse = true;
        sort_dirs_first = true;
        linemode = "size_and_mtime";
      };
    };
  };
}
