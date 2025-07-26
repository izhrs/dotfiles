let
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

  language-server = {
    emmet-ls = {
      command = "emmet-ls";
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
      file-types = [ "py" ];
      auto-format = true;
      formatter = {
        command = "black";
        args = [ "--quiet" "-" ];
      };
      language-servers = [ "pyright" ];
    }

    {
      name = "bash";
      scope = "source.bash";
      file-types = [ "sh" "bash" ];
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
      file-types = [ "Dockerfile" ];
      auto-format = true;
      formatter = {
        command = "dockfmt";
        args = [ "fmt" "-" ];
      };
      language-servers = [ "docker-langserver" ];
    }

    {
      name = "docker-compose";
      scope = "source.yaml.docker-compose";
      file-types = [ "docker-compose.yml" "docker-compose.yaml" ];
      auto-format = true;
      formatter = prettierFormatter "yaml";
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
      file-types = [ "scss" ];
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
  ];
}
