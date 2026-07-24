{ pkgs, ... }: {
  home.file.".config/dprint/dprint.jsonc".text = builtins.toJSON {
    lineWidth = 100;
    indentWidth = 4;

    plugins = [
      "${pkgs.dprint-plugins.dprint-plugin-dockerfile}/plugin.wasm"
      "${pkgs.dprint-plugins.dprint-plugin-json}/plugin.wasm"
      "${pkgs.dprint-plugins.dprint-plugin-markdown}/plugin.wasm"
      "${pkgs.dprint-plugins.dprint-plugin-toml}/plugin.wasm"
      "${pkgs.dprint-plugins.dprint-plugin-typescript}/plugin.wasm"
      "${pkgs.dprint-plugins.g-plane-malva}/plugin.wasm"
      "${pkgs.dprint-plugins.g-plane-markup_fmt}/plugin.wasm"
      "${pkgs.dprint-plugins.g-plane-pretty_yaml}/plugin.wasm"
    ];

    typescript = {
      indentWidth = 4;
      lineWidth = 100;
      quoteStyle = "alwaysDouble";
      semiColons = "always";
      "arrowFunction.useParentheses" = "force";
    };

    # HTML, svelte, astro, vue
    markup = {
      indentWidth = 4;
      quotes = "double";
      formatComments = true;
      scriptIndent = true;
      styleIndent = true;
      closingTagLineBreakForEmpty = "always";
      "html.normal.selfClosing" = true;
      "html.void.selfClosing" = true;
      "component.selfClosing" = true;
      "svg.selfClosing" = true;
      doctypeKeywordCase = "upper";
    };

    # CSS, SCSS, Sass, Less
    malva = {
      quotes = "alwaysDouble";
      formatComments = true;
      alignComments = true;
      indentWidth = 4;
    };

    excludes = [
      "**/*-lock.json"
    ];

    json = {
      indentWidth = 4;
    };
  };
}
