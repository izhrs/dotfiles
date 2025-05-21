{ pkgs, ... }:
let
  moonflyYaziTheme = pkgs.fetchFromGitHub {
    owner = "tkapias";
    repo = "moonfly.yazi";
    rev = "main";
    sha256 = "sha256-9K2e+wodG3XOdcKgPJA4fYZCXZylWRTRM1IHrc+I7bw";
  };
in {
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
