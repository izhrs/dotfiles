{
  stylix.targets.starship.enable = false;

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {

      palette = "term";
      #optimised for m3-tonal-spot
      palettes.term = {
        rosewater = "7";
        flamingo = "7";
        pink = "4";
        mauve = "4";
        red = "1";
        maroon = "1";
        peach = "1";
        yellow = "1";
        green = "1";
        teal = "4";
        sky = "4";
        sapphire = "4";
        blue = "4";
        lavender = "2";
        text = "7";
        subtext1 = "7";
        subtext0 = "7";
        overlay2 = "0";
        overlay1 = "0";
        overlay0 = "0";
        surface2 = "0";
        surface1 = "0";
        surface0 = "0";
        base = "0";
        mantle = "0";
        crust = "0";
      };

      format = ''
        [](lavender)[](bg:lavender fg:base)[](bg:blue fg:lavender)$directory$git_branch$git_status$git_state$rust$golang$nodejs$lua$nix_shell$dart$haskell$julia$python$elm$elixir$scala$aws$docker_context$package$cmd_duration
        $character
      '';
      # username = {
      #   style_user = "mauve bold";
      #   style_root = "red bold";
      #   format = "[\\[\\[$user]($style) ";
      #   disabled = false;
      #   show_always = true;
      # };

      # hostname = {
      #   ssh_only = false;
      #   format = "[](bold mauve) [](bold blue) [](bold green) ";
      #   trim_at = ".";
      #   disabled = false;
      # };

      character = {
        success_symbol = "[──❯](bold lavender)[❯](bold blue)[❯](bold green)";
        error_symbol = "[──❯❯❯](bold red)";
      };

      directory = {
        read_only = " ";
        format = "[ $path](bg:blue fg:base)[$read_only](bg:blue fg:red)[](blue) ";
        truncation_length = 10;
        truncate_to_repo = true;
      };

      cmd_duration = {
        min_time = 4;
        show_milliseconds = false;
        disabled = false;
        style = "bold italic sky";
        format = "[\\[](bold italic blue)[$duration]($style)[\\]](bold italic blue)";
      };

      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";

      docker_context = {
        symbol = " ";
        format = "via [$symbol$context]($style) ";
        style = "blue bold";
        only_with_files = true;
        detect_files = [
          "docker-compose.yml"
          "docker-compose.yaml"
          "Dockerfile"
        ];
        detect_folders = [ ];
        disabled = false;
      };

      elixir.symbol = " ";
      elm.symbol = " ";

      git_branch = {
        symbol = " ";
        style = "bold mauve";
      };

      git_status = {
        style = "bold mauve";
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
        style = "bold mauve";
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
        format = "via [\${symbol}python (\${version} )(\\(\${virtualenv}\\) )]($style)";
        style = "bold yellow";
        pyenv_prefix = "venv ";
        python_binary = [
          "./venv/bin/python"
          "python"
          "python3"
          "python2"
        ];
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
        detect_files = [
          "package.json"
          ".node-version"
        ];
        detect_folders = [ "node_modules" ];
      };
    };
  };
}
