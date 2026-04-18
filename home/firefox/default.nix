{ pkgs, ... }:
{
  programs.firefox = {

    enable = true;
    profiles.default = {
      search = {
        default = "ddg";
      };

      userChrome = builtins.readFile ./userChrome.css;
      userContent = builtins.readFile ./userContent.css;

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
        # "accessibility.force_disabled" = 1;
        "browser.aboutConfig.showWarning" = false;
        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
        "browser.newtabpage.enabled" = false;
        "browser.startup.homepage" = "about:home";
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.urlbar.autoFill.adaptiveHistory.enabled" = true;
        "browser.startup.page" = 3;
        "browser.tabs.inTitlebar" = 1;
        "dom.payments.defaults.saveAddress" = false;
        "dom.security.https_only_mode" = true;
        "dom.storage.next_gen" = true;
        "extensions.autoDisableScopes" = 0;
        "extensions.formautofill.addresses.enabled" = true;
        "extensions.formautofill.available" = "detect";
        "extensions.formautofill.creditCards.enabled" = true;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.enabled" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
        "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "privacy.window.name.update.enabled" = true;
        "sidebar.animation.enabled" = false; # fwfox
        "svg.context-properties.content.enabled" = true; # gwfox
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # gwfox
        "widget.gtk.rounded-bottom-corners.enabled" = true; # gwfox

        "gwfox.plus" = true;
        "gwfox.bms" = true;
        "gwfox.icons" = true;
        "gwfox.blur" = true;
        "gwfox.noborder" = true;
        "gwfox.ac" = false;
        "gwfox.tp" = true;
        "gwfox.sidebar" = 3;
      };
    };
  };

  xdg.desktopEntries.firefox_focus = {
    name = "Firefox Focus";
    genericName = "Web Browser";
    comment = "New Private Window";
    exec = "firefox --private-window %U";
    terminal = false;
    type = "Application";
    icon = "${pkgs.tela-circle-icon-theme}/share/icons/Tela-circle/scalable/apps/firefox-developer.svg";
    categories = [
      "Network"
      "WebBrowser"
    ];
    startupNotify = true;
  };
}
