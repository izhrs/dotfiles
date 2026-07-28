{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "kitty-direct";
        source = ./logo.png;
        # height = 16;
        width = 34;
        padding = {
          top = 8;
          bottom = 8;
          right = 5;
          left = 5;
        };
      };

      display = {
        separator = " -> ";
      };

      modules = [
        "break"

        {
          type = "custom";
          format = "╭────────────────────── Hardware ──────────────────────╮";
          outputColor = "red";
        }

        {
          type = "title";
          key = " PC";
          keyColor = "green";
          format = "{user-name-colored} on {host-name-colored}";
        }

        {
          type = "cpu";
          key = "│ ├󰍛 CPU";
          showPeCoreCount = true;
          format = "{name} {freq-max}";
          keyColor = "green";
        }

        {
          type = "gpu";
          key = "│ ├󰍛 GPU";
          keyColor = "green";
          format = "{vendor} {name}";
        }

        {
          type = "disk";
          key = "│ ├󱛟 Disk";
          keyColor = "green";
        }

        {
          type = "memory";
          key = "└ └󰍛 Memory";
          keyColor = "green";
        }

        {
          type = "custom";
          format = "╰──────────────────────────────────────────────────────╯";
          outputColor = "red";
        }

        "break"

        {
          type = "custom";
          format = "╭────────────────────── Software ──────────────────────╮";
          outputColor = "red";
        }

        {
          type = "os";
          key = " OS";
          keyColor = "yellow";
          # TODO: use the pretty name
          # format = "{pretty-name} {version-id} {codename}";
          format = "NixOS {version-id} {codename}";
        }

        {
          type = "kernel";
          key = "│ ├ Kernel";
          keyColor = "yellow";
        }

        {
          type = "shell";
          key = "│ ├ Shell";
          keyColor = "yellow";
          format = "{1}";
        }

        {
          type = "packages";
          key = "│ ├󰏖 Packages";
          keyColor = "yellow";
        }

        {
          type = "command";
          key = "│ ├ OS Age";
          keyColor = "yellow";
          text = ''
            birth_install=$(stat -c %W /); \
            current=$(date +%s); \
            time_progression=$((current - birth_install)); \
            days_difference=$((time_progression / 86400)); \
            echo $days_difference days
          '';
        }

        {
          type = "uptime";
          key = "└ └ Uptime";
          keyColor = "yellow";
        }

        "break"

        {
          type = "wm";
          key = " Compositor";
          keyColor = "blue";
          format = "{1}";
        }

        {
          type = "lm";
          key = "│ ├ Login";
          keyColor = "blue";
          format = "{1}";
        }

        {
          type = "terminal";
          key = "│ ├ Terminal";
          keyColor = "blue";
          format = "{1}";
        }

        {
          type = "terminalfont";
          key = "│ ├ Font";
          keyColor = "blue";
          format = "{name}";
        }

        {
          type = "icons";
          key = "│ ├󰄛 Icons";
          keyColor = "blue";
        }

        {
          type = "custom";
          key = "└ └ Theme";
          keyColor = "blue";
          format = "Stylix";
        }

        {
          type = "custom";
          format = "╰──────────────────────────────────────────────────────╯";
          outputColor = "red";
        }

        {
          type = "colors";
          paddingLeft = 20;
          symbol = "circle";
        }

        "break"
      ];
    };
  };
}
