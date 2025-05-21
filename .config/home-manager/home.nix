{ config, pkgs, ... }:
let
  moonflyYaziTheme = pkgs.fetchFromGitHub {
    owner = "tkapias";
    repo = "moonfly.yazi";
    rev = "main";
    sha256 = "sha256-9K2e+wodG3XOdcKgPJA4fYZCXZylWRTRM1IHrc+I7bw";
  };
in {
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "24.11";

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = { EDITOR = "nvim"; };

  # for non nixos
  # home.shell.enableNushellIntegration = true;

  programs.home-manager.enable = true;

  xdg.mimeApps.defaultApplications = { "text/plain" = [ "neovide.desktop" ]; };

  programs.git = {
    enable = true;
    userName = "izhrs";
    userEmail = "mohamed@izhar.xyz";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
      };

    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        pager = "delta --dark --line-numbers --side-by-side --paging=never";
        colorArg = "always";
        useConfig = false;
      };
    };
  };

  programs.kitty = {
    enable = true;
    font.size = 13;
    font.name = "JetBrainsMono Nerd Font Mono";
    settings = {
      background_opacity = 0.85;
      placement_strategy = "center";
      window_padding_width = "10 10";
      background_blur = 40;
      hide_window_decorations = true;
      enable_audio_bell = false;
      window_alert_on_bell = false;
    };
  };

  programs.nushell = {
    enable = true;
    settings = { show_banner = false; };
    environmentVariables = { EDITOR = "nvim"; };
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      cat = "bat";
      ps = "procs";
      l = "ls -l";
      ll = "ls -la";
      diff = "delta";
      serve = "miniserve";
      fm = "yazi";
      gg = "lazygit";
    };
  };

  # shell completion
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      username = {
        style_user = "green bold";
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
        success_symbol = "[╰──❯](bold green)[❯](bold cyan)[❯](bold blue)";
        error_symbol = "[╰──](bold green)[❯❯❯](bold red)";
      };

      directory = {
        read_only = " ";
        truncation_length = 10;
        truncate_to_repo = true;
        style = "bold italic cyan";
      };

      cmd_duration = {
        min_time = 4;
        show_milliseconds = false;
        disabled = false;
        style = "bold italic cyan";
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

  programs.fastfetch = { enable = true; };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.yazi = {
    enable = true;
    plugins = {
      full-border = pkgs.yaziPlugins.full-border;
      starship = pkgs.yaziPlugins.starship;
    };
    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()
    '';
    theme = {
      flavor = {
        light = "moonfly";
        dark = "moonfly";
      };
    };
    flavors = { moonfly = moonflyYaziTheme; };
    settings = {
      manager = {
        # 2/9 width for parent, 4/9 for main, 3/9 for preview
        ratio = [ 2 4 3 ];
        show_hidden = true;
        sort_by = "mtime";
        sort_reverse = true;
      };
    };
  };
}
