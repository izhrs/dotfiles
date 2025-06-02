{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;

    settings = {
      palette = "catppuccin_mocha";

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      username = {
        style_user = "mauve bold";
        style_root = "red bold";
        format = "[╭─\\[\\[$user]($style) ";
        disabled = false;
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "on [$hostname\\]\\]](bold blue) ";
        trim_at = ".";
        disabled = false;
      };

      character = {
        success_symbol = "[╰──❯](bold mauve)[❯](bold blue)[❯](bold green)";
        error_symbol = "[╰──](bold mauve)[❯❯❯](bold red)";
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true;
        style = "bold italic sky";
      };

      cmd_duration = {
        min_time = 4;
        show_milliseconds = false;
        disabled = false;
        style = "bold italic sky";
        format =
          "[\\[](bold italic blue)[$duration]($style)[\\]](bold italic blue)";
      };

      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";

      docker_context = {
        symbol = " ";
        format = "via [$symbol$context]($style) ";
        style = "blue bold";
        only_with_files = true;
        detect_files =
          [ "docker-compose.yml" "docker-compose.yaml" "Dockerfile" ];
        detect_folders = [ ];
        disabled = false;
      };

      elixir.symbol = " ";
      elm.symbol = " ";
      git_branch.symbol = " ";

      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style) )";
        stashed = "[\${count}*](green)";
        modified = "[\${count}+](yellow)";
        deleted = "[\${count}-](red)";
        conflicted = "[\${count}~](red)";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        untracked = "[\${count}?](blue)";
        staged = "[\${count}+](green)";
      };

      git_state = {
        style = "bold red";
        format = "[$state( $progress_current/$progress_total) ]($style)";
        rebase = "rebase";
        merge = "merge";
        revert = "revert";
        cherry_pick = "cherry";
        bisect = "bisect";
        am = "am";
        am_or_rebase = "am/rebase";
      };

      golang.symbol = " ";
      lua.symbol = "󰢱 ";
      hg_branch.symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      haskell.symbol = "λ ";
      nix_shell.symbol = " ";
      package.symbol = " ";
      perl.symbol = " ";
      php.symbol = " ";

      python = {
        symbol = "🐍 ";
        format =
          "via [\${symbol}python (\${version} )(\\(\${virtualenv}\\) )]($style)";
        style = "bold yellow";
        pyenv_prefix = "venv ";
        python_binary = [ "./venv/bin/python" "python" "python3" "python2" ];
        detect_extensions = [ "py" ];
        version_format = "v\${raw}";
      };

      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      shlvl.symbol = " ";
      swift.symbol = "ﯣ ";

      nodejs = {
        format = "via [󰎙 Node.js $version](bold green) ";
        detect_files = [ "package.json" ".node-version" ];
        detect_folders = [ "node_modules" ];
      };
    };
  };
}
