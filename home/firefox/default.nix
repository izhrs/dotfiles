{ pkgs, ... }:
{
  stylix.targets.firefox.enable = true;
  stylix.targets.firefox.profileNames = [ "default" ];

  # use pywalfox with noctalia's template for dynamic theming
  stylix.targets.firefox.colorTheme.enable = false;

  programs.firefox = {
    enable = true;
    profiles.default = {
      search = {
        default = "ddg";
      };

      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          geo-spoof
          ghostery
          privacy-badger
          proton-vpn
          pywalfox
          refined-github
          ublock-origin
          vimium
        ];

        force = true;
      };

      settings = {
        "accessibility.force_disabled" = 1;

        "browser.aboutConfig.showWarning" = false;
        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
        "browser.newtabpage.enabled" = true;
        "browser.startup.homepage" = "about:home";
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.startup.page" = 3;
        "browser.tabs.inTitlebar" = 1;
        "browser.urlbar.autoFill.adaptiveHistory.enabled" = true;

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
        "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = false;
        "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.trackingprotection.enabled" = true;
        "privacy.userContext.enabled" = true;
        "privacy.userContext.ui.enabled" = true;
        "privacy.window.name.update.enabled" = true;

        "signon.rememberSignons" = false; # disables firefox password manager
        "widget.gtk.rounded-bottom-corners.enabled" = true;
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
    icon = "${pkgs.colloid-icon-theme}/share/icons/Colloid/apps/scalable/firefox-developer.svg";
    categories = [
      "Network"
      "WebBrowser"
    ];
    startupNotify = true;
  };
}
