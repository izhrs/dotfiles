{
  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        pager = "delta --dark --line-numbers --side-by-side --paging=never";
        colorArg = "always";
        useConfig = false;
      };
      gui = {
        sidePanelWidth = 0.2;
        expandFocusedSidePanel = true;
        showCommandLog = false;
        showRandomTip = false;
        nerdFontsVersion = 3;
        animateExplosion = true;
      };
    };
  };
}
