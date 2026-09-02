{ pkgs, ... }:
{
  # Find the Colloid icon theme color that is perceptually closest to the given color.
  # These colors are taken from the Colloid icons theme; change this list if using a different icon theme.
  #
  # requires installation of all the color varients and scheme varients
  # see ../../system/stylix.nix
  home.packages = [
    (pkgs.writers.writePython3Bin "closest-icon-theme"
      {
        libraries = with pkgs.python3Packages; [
          coloraide
        ];
      }
      ''
        import sys
        from coloraide import Color

        COLORS = {
            "Colloid": "#5b9bf8",
            "Colloid-Purple": "#BA68C8",
            "Colloid-Pink": "#F06292",
            "Colloid-Red": "#F44336",
            "Colloid-Orange": "#FB8C00",
            "Colloid-Yellow": "#FFD600",
            "Colloid-Green": "#66BB6A",
            "Colloid-Teal": "#4DB6AC",
            "Colloid-Grey": "#888888",

            "Colloid-Nord": "#89a3c2",
            "Colloid-Purple-Nord": "#c89dbf",
            "Colloid-Pink-Nord": "#dc98b1",
            "Colloid-Red-Nord": "#d4878f",
            "Colloid-Orange-Nord": "#dca493",
            "Colloid-Yellow-Nord": "#eac985",
            "Colloid-Green-Nord": "#a0c082",
            "Colloid-Teal-Nord": "#83b9b8",
            "Colloid-Grey-Nord": "#757a99",

            "Colloid-Dracula": "#6272a4",
            "Colloid-Purple-Dracula": "#bd93f9",
            "Colloid-Pink-Dracula": "#ff79c6",
            "Colloid-Red-Dracula": "#ff5555",
            "Colloid-Orange-Dracula": "#ffb86c",
            "Colloid-Yellow-Dracula": "#f1fa8c",
            "Colloid-Green-Dracula": "#50fa7b",
            "Colloid-Teal-Dracula": "#50fae9",
            "Colloid-Grey-Dracula": "#757a99",

            "Colloid-Gruvbox": "#83a598",
            "Colloid-Purple-Gruvbox": "#d386cd",
            "Colloid-Pink-Gruvbox": "#d3869b",
            "Colloid-Red-Gruvbox": "#fb4934",
            "Colloid-Orange-Gruvbox": "#fe8019",
            "Colloid-Yellow-Gruvbox": "#fabd2f",
            "Colloid-Green-Gruvbox": "#b8bb26",
            "Colloid-Teal-Gruvbox": "#8ec07c",
            "Colloid-Grey-Gruvbox": "#868686",

            "Colloid-Everforest": "#7fbbb3",
            "Colloid-Purple-Everforest": "#D699B6",
            "Colloid-Pink-Everforest": "#d3869b",
            "Colloid-Red-Everforest": "#E67E80",
            "Colloid-Orange-Everforest": "#E69875",
            "Colloid-Yellow-Everforest": "#DBBC7F",
            "Colloid-Green-Everforest": "#A7C080",
            "Colloid-Teal-Everforest": "#83C092",
            "Colloid-Grey-Everforest": "#7a8478",

            "Colloid-Catppuccin": "#8caaee",
            "Colloid-Purple-Catppuccin": "#ca9ee6",
            "Colloid-Pink-Catppuccin": "#f4b8e4",
            "Colloid-Red-Catppuccin": "#ea999c",
            "Colloid-Orange-Catppuccin": "#fe8019",
            "Colloid-Yellow-Catppuccin": "#ef9f76",
            "Colloid-Green-Catppuccin": "#a6d189",
            "Colloid-Teal-Catppuccin": "#81c8be",
            "Colloid-Grey-Catppuccin": "#7c7f93",
        }

        if len(sys.argv) != 2:
            print(f"usage: {sys.argv[0]} <hex-color>", file=sys.stderr)
            sys.exit(1)

        target = Color(sys.argv[1]).convert("oklab")

        closest_name, closest_color = min(
            COLORS.items(),
            key=lambda item: target.delta_e(
                Color(item[1]).convert("oklab"),
                method="76",
            ),
        )

        print(closest_name)
      ''
    )
  ];
}
