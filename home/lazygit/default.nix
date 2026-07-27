{ config, ... }: {
  stylix.targets.lazygit.enable = true;

  programs.lazygit = {
    enable = true;
    settings = {
      git.pagers = [
        {
          pager = "delta --${config.stylix.polarity} --line-numbers --side-by-side --paging=never";
          colorArg = "always";
          useConfig = false;
        }
      ];

      gui = {
        # also removes the "Donate" and "Ask questions" button
        mouseEvents = false;

        animateExplosion = true;
        expandFocusedSidePanel = true;
        nerdFontsVersion = 3;
        showCommandLog = false;
        showListFooter = false;
        showRandomTip = false;
        statusPanelView = "allBranchesLog";
        sidePanelWidth = 0.2;
      };
    };
  };
}
