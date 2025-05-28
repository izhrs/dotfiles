{ inputs, pkgs, ... }: {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  nixpkgs.config.allowUnfree = true;

  programs.spicetify =
    let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [ hidePodcasts ];
      # enabledCustomApps = with spicePkgs.apps; [ newReleases ncsVisualizer ];
      # enabledSnippets = with spicePkgs.snippets; [ rotatingCoverart pointer ];

      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
