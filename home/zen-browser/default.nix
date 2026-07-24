{ pkgs, ... }:
{
  stylix.targets.zen-browser.enable = true;
  stylix.targets.zen-browser.profileNames = [ "default" ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
    };

    profiles.default = {
      search = {
        default = "ddg";
        force = true;
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        ghostery
        privacy-badger
        proton-vpn
        refined-github
        ublock-origin
        vimium
      ];

      extensions.force = true;

      settings = {
        # Check these out at about:config
        "accessibility.force_disabled" = 1;
        "browser.aboutConfig.showWarning" = false;
        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
        "browser.newtabpage.enabled" = false;

        "browser.tabs.allow_transparent_browser" = true;
        "widget.windows.mica" = true;
        "zen.theme.gradient.show-custom-colors" = true;
        "zen.urlbar.behavior" = "float";
        "zen.welcome-screen.seen" = true;
        "zen.widget.linux.transparency" = true;
        "zen.window-sync.enabled" = false;

        "browser.startup.homepage" = "about:home";
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.urlbar.autoFill.adaptiveHistory.enabled" = true;
        "browser.startup.page" = 3;
        # "browser.tabs.inTitlebar" = 1;
        "dom.payments.defaults.saveAddress" = false;
        "dom.security.https_only_mode" = true;
        "extensions.autoDisableScopes" = 0;
        "extensions.formautofill.addresses.enabled" = true;
        "extensions.formautofill.available" = "detect";
        "extensions.formautofill.creditCards.enabled" = true;
      };

      userChrome = ''
        :root:not([inDOMFullscreen="true"]):not([chromehidden~="location"]):not([chromehidden~="toolbar"]) {
          & #tabbrowser-tabbox #tabbrowser-tabpanels .browserSidebarContainer {
            & browser[transparent="true"] {
              background: none !important;
            }
          }
        }

        :root {
          --zen-branding-dark: #00000000 !important;
          --zen-themed-toolbar-bg-transparent: transparent !important;
        } 
      '';
    };
  };
}
