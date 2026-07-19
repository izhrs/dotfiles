{ lib, ... }: {
  programs.lazygit = {
    enable = true;
    settings = {
      git.pagers = [
        {
          pager = "delta --dark --line-numbers --side-by-side --paging=never";
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

        # catppuccin mocha
        theme = {
          activeBorderColor = [
            "#b4befe"
            "bold"
          ];
          inactiveBorderColor = [ "#a6adc8" ];
          searchingActiveBorderColor = [ "#f9e2af" ];
          optionsTextColor = [ "#89b4fa" ];
          selectedLineBgColor = [ "#313244" ];
          inactiveViewSelectedLineBgColor = [ "#6c7086" ];
          cherryPickedCommitFgColor = [ "#b4befe" ];
          cherryPickedCommitBgColor = [ "#45475a" ];
          markedBaseCommitFgColor = [ "#89b4fa" ];
          markedBaseCommitBgColor = [ "#f9e2af" ];
          unstagedChangesColor = [ "#f38ba8" ];
          defaultFgColor = [ "#cdd6f4" ];
        };

        authorColors."*" = "#b4befe";
      };
    };
  };

  specialisation.light.configuration = {
    programs.lazygit.settings.git.paging = lib.mkForce {
      pager = "delta --light --line-numbers --side-by-side --paging=never";
      colorArg = "always";
      useConfig = false;
    };

    # catppuccin latte
    programs.lazygit.settings.gui.theme = lib.mkForce {
      activeBorderColor = [
        "#7287fd"
        "bold"
      ];
      inactiveBorderColor = [ "#9ca0b0" ];
      searchingActiveBorderColor = [ "#df8e1d" ];
      optionsTextColor = [ "#1e66f5" ];
      selectedLineBgColor = [ "#ccd0da" ];
      inactiveViewSelectedLineBgColor = [ "#9ca0b0" ];
      cherryPickedCommitFgColor = [ "#7287fd" ];
      cherryPickedCommitBgColor = [ "#acb0be" ];
      markedBaseCommitFgColor = [ "#1e66f5" ];
      markedBaseCommitBgColor = [ "#df8e1d" ];
      unstagedChangesColor = [ "#d20f39" ];
      defaultFgColor = [ "#4c4f69" ];
    };
    programs.lazygit.settings.gui.authorColors = lib.mkForce {
      "*" = "#7287fd";
    };
  };
}
