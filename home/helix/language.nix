{ pkgs, ... }:
let
  # this is just a funtion with parser as argument
  prettierFormatter = parser: {
    command = "prettier";
    args = [
      "--parser"
      parser
      "--single-quote=false"
      "--jsx-single-quote=false"
      "--trailing-comma=all"
      "--semi=true"
      "--tab-width=4"
      "--use-tabs=false"
      "--print-width=80"
    ];
  };

in {
  # all the LSP and formatter binaries/packages are defined in ./extraPackages.nix
  language-server = {
    emmet-ls = {
      command = "emmet-ls";
      args = [ "--stdio" ];
    };

    docker-compose-ls = {
      command = "docker-compose-langserver";
      args = [ "--stdio" ];
    };

    tailwind-ls = {
      command = "tailwindcss-language-server";
      args = [ "--stdio" ];
      config = {
        userLanguages = {
          svelte = "html";
          "*.svelte" = "html";
          astro = "html";
          "*.astro" = "html";
          javascript = "javascript";
          typescript = "typescript";
          javascriptreact = "javascript";
          typescriptreact = "typescript";
        };
      };
    };

    ty-lsp = {
      command = "ty";
      args = [ "server" ];
    };

    tinymist-lsp = {
      command = "tinymist";
      config = {
        typstExtraArgs = [ "main.typ" ];
        exportPdf = "onType";
        outputPath = "$root/target/$dir/$name";

        lint = {
          enabled = true;
          when = "onSave";
        };

        preview.background.enabled = true;
        preview.background.args =
          [ "--data-plane-host=127.0.0.1:8080" "--invert-colors=auto" ];
      };
    };

    ruff-lsp = {
      command = "ruff";
      agrs = [ "server" ];
    };

    svelte-ls = {
      command = "svelteserver";
      args = [ "--stdio" ];
      config = {
        svelte = {
          plugin = {
            typescript = {
              enable = true;
              diagnostics = true;
            };
            css = { enable = true; };
            html = { enable = true; };
            svelte = { compilerWarnings = { a11y-no-onchange = "ignore"; }; };
          };
        };
      };
    };

    powershell-ls = {
      command = "pwsh";
      args = [
        "-NoLogo"
        "-NoProfile"
        "-Command"
        "${pkgs.powershell-editor-services}/lib/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1"
        "-BundledModulesPath"
        "${pkgs.powershell-editor-services}/bin/powershell-editor-services"
        "-SessionDetailsPath"
        "/tmp/powershell_es.session.json"
        "-LogPath"
        "/tmp/powershell_es.log" # nix is immutable
        "-FeatureFlags"
        "@()"
        "-AdditionalModules"
        "@()"
        "-HostName"
        "helix"
        "-HostProfileId"
        "0"
        "-HostVersion"
        "1.0.0"
        "-Stdio"
        "-LogLevel"
        "Normal"
      ];
    };
  };

  language = [

    {
      name = "rust";
      scope = "source.rust";
      file-types = [ "rs" ];
      auto-format = true;
      formatter = {
        command = "rustfmt";
        args = [ "--edition" "2024" ];
      };
    }

    {
      name = "c";
      scope = "source.c";
      file-types = [ "c" "h" ];
      auto-format = true;
      formatter = {
        command = "clang-format";
        args = [
          "--assume-filename"
          "main.c"
          "--style"
          "{BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100}"
        ];
      };
    }

    {
      name = "cpp";
      scope = "source.cpp";
      file-types = [ "cpp" "hpp" "cc" "cxx" "hh" "h" ];
      auto-format = true;
      formatter = {
        command = "clang-format";
        args = [
          "--assume-filename"
          "main.cpp"
          "--style"
          "{BasedOnStyle: LLVM, IndentWidth: 4, ColumnLimit: 100}"
        ];
      };
    }

    {
      name = "nix";
      scope = "source.nix";
      file-types = [ "nix" ];
      auto-format = true;
      formatter = {
        command = "nixfmt";
        args = [ ];
      };
    }

    {
      name = "lua";
      scope = "source.lua";
      roots = [ ".git" "stylua.toml" ];
      file-types = [ "lua" ];
      auto-format = true;
      formatter = {
        command = "stylua";
        args = [ "-" ];
      };
    }

    {
      name = "python";
      scope = "source.python";
      roots = [
        "pyproject.toml"
        "setup.py"
        "poetry.lock"
        "pyrightconfig.json"
        "requirements.txt"
        ".venv/"
      ];
      file-types = [
        "py"
        "pyi"
        "py3"
        "pyw"
        "ptl"
        "rpy"
        "cpy"
        "ipy"
        "pyt"
        { glob = ".python_history"; }
        { glob = ".pythonstartup"; }
        { glob = ".pythonrc"; }
        { glob = "SConstruct"; }
        { glob = "SConscript"; }
      ];
      auto-format = true;
      formatter = {
        command = "ruff";
        args = [ "format" "-" ];
      };
      language-servers = [ "ty-lsp" "ruff-lsp" ];
    }

    {
      name = "bash";
      scope = "source.bash";
      file-types = [
        "config"
        "sh"
        { glob = ".zshrc"; }
        { glob = ".bash_login"; }
        { glob = ".bash_logout"; }
        { glob = ".bash_profile"; }
        { glob = ".bashrc"; }
        { glob = ".profile"; }
        { glob = ".zshenv"; }
        { glob = ".zlogin"; }
        { glob = ".zlogout"; }
        { glob = ".zprofile"; }
        { glob = ".zshrc"; }
        { glob = "APKBUILD"; }
        { glob = "PKGBUILD"; }
        { glob = "eclass"; }
        { glob = "ebuild"; }
        { glob = "bazelrc"; }
        { glob = ".bash_aliases"; }
      ];
      auto-format = true;
      formatter = {
        command = "shfmt";
        args = [ "-filename" "\${INPUT}" "-i" "4" "-ci" "-sr" ];
      };
      language-servers = [ "bash-language-server" ];
    }

    {
      name = "dockerfile";
      scope = "source.dockerfile";
      file-types = [ "Dockerfile" { glob = "Dockerfile"; } ];
      auto-format = true;
      formatter = {
        command = "dockfmt";
        args = [ "fmt" ];
      };
      language-servers = [ "docker-langserver" ];
    }

    {
      name = "docker-compose";
      scope = "source.yaml.docker-compose";
      file-types = [ "docker-compose.yml" "docker-compose.yaml" ];
      auto-format = true;
      formatter = prettierFormatter "yaml";
      language-servers = [ "docker-compose-ls" ];
    }

    {
      name = "javascript";
      scope = "source.js";
      file-types = [ "js" ];
      auto-format = true;
      formatter = prettierFormatter "babel";
      language-servers = [ "typescript-language-server" "tailwind-ls" ];
    }

    {
      name = "typescript";
      scope = "source.ts";
      file-types = [ "ts" ];
      auto-format = true;
      formatter = prettierFormatter "typescript";
      language-servers = [ "typescript-language-server" "tailwind-ls" ];
    }

    {
      name = "jsx";
      scope = "source.jsx";
      file-types = [ "jsx" ];
      auto-format = true;
      formatter = prettierFormatter "babel";
      language-servers =
        [ "typescript-language-server" "emmet-ls" "tailwind-ls" ];
    }

    {
      name = "tsx";
      scope = "source.tsx";
      file-types = [ "tsx" ];
      auto-format = true;
      formatter = prettierFormatter "typescript";
      language-servers =
        [ "typescript-language-server" "emmet-ls" "tailwind-ls" ];
    }

    {
      name = "json";
      scope = "source.json";
      file-types = [ "json" ];
      auto-format = true;
      formatter = prettierFormatter "json";
    }

    {
      name = "yaml";
      scope = "source.yaml";
      file-types = [ "yaml" "yml" ];
      auto-format = true;
      formatter = prettierFormatter "yaml";
      language-servers = [ "yaml-language-server" ];
    }

    {
      name = "markdown";
      scope = "source.md";
      file-types = [ "md" "markdown" ];
      auto-format = true;
      formatter = prettierFormatter "markdown";
    }

    {
      name = "html";
      scope = "text.html.basic";
      file-types = [ "html" ];
      auto-format = true;
      formatter = prettierFormatter "html";
      language-servers = [ "emmet-ls" "tailwind-ls" ];
    }

    {
      name = "css";
      scope = "source.css";
      file-types = [ "css" ];
      auto-format = true;
      formatter = prettierFormatter "css";
      language-servers =
        [ "vscode-css-language-server" "emmet-ls" "tailwind-ls" ];
    }

    {
      name = "scss";
      scope = "source.scss";
      file-types = [ "scss" "rasi" ];
      auto-format = true;
      formatter = prettierFormatter "scss";
      language-servers =
        [ "vscode-css-language-server" "emmet-ls" "tailwind-ls" ];
    }

    {
      name = "svelte";
      scope = "source.svelte";
      file-types = [ "svelte" ];
      auto-format = true;
      formatter = prettierFormatter "svelte";
      language-servers = [ "svelte-ls" "emmet-ls" "tailwind-ls" ];
    }

    {
      name = "toml";
      scope = "source.toml";
      file-types = [ "toml" ];
      auto-format = true;
      formatter = {
        command = "taplo";
        args = [ "fmt" "-" ];
      };
      language-servers = [ "taplo" ];
    }

    {
      name = "powershell";
      scope = "source.ps1";
      roots = [ ".git" ];
      comment-token = "#";
      indent = {
        tab-width = 4;
        unit = " ";
      };
      language-servers = [ "powershell-ls" ];
    }

    {
      name = "typst";
      scope = "source.typst";
      file-types = [ "typ" "typst" ];
      language-servers = [ "tinymist-lsp" ];
      formatter = { command = "typstyle"; };
      auto-format = true;
    }
  ];
}
