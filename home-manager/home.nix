{ config, pkgs, ... }:

{
  home.username = "izhrs";
  home.homeDirectory = "/home/izhrs";
  home.stateVersion = "24.11";
  
  home.packages = with pkgs; [
    bat
    bottom
    cargo
    curl
    dust
    delta
    fzf
    fd
    gcc
    k3s
    kubectl
    miniserve
    nodejs_24
    nodePackages.prettier
    procs
    python314
    rsync
    rust-analyzer
    ripgrep
    sd
    tokei
    tree
    wget
    yarn
    yt-dlp
    zip
    unzip
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "izhrs";
    userEmail = "mohamed@izhar.xyz";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };

  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };

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
    };

    environmentVariables = {
      EDITOR = "nvim";
    };

    envFile.text = "$env.PATH = ($env.PATH | append '/home/izhrs/.nix-profile/bin/' | append '/nix/var/nix/profiles/default/bin/')";
  };

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
        format = "on [nixos\\]\\]](bold blue)";
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

  programs.fastfetch = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.yazi = {
    enable = true;
#     flavors = {
#       use = "moonfly";
#     };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}


