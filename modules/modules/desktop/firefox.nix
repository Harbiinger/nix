{ den, ... }: {

  den.aspects.firefox = {
    
    nixos = { lib, ... }: {};

    homeManager = { pkgs, ... }: {
      programs.firefox = {
        enable = true;

        profiles.default = {
          id = 0;
          isDefault = true;
          name = "Default";

          search = {
            default = "ddg";
            force = true;
            engines = {
              "nix-packages" = {
                urls = [
                  {
                    template = "https://search.nixos.org/packages";
                    params = [
                      {
                        name = "type";
                        value = "packages";
                      }
                      {
                        name = "query";
                        value = "{searchTerms}";
                      }
                    ];
                  }
                ];

                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };

              "bing".metaData.hidden = true;
              "duckduckgo".metaData.hidden = true;
              "amazonnl".metaData.hidden = true;
              "ebay".metaData.hidden = true;
              "google".metaData.alias = "@g";
            };
          };

          settings = {
            "app.update.auto" = false;
            "browser.startup.homepage" = "";
            "browser.aboutConfig.showWarning" = false;
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_ever_enabled" = true;
            "privacy.donottrackheader.enabled" = true;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.partition.network_state.ocsp_cache" = true;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.fullscreen.autohide" = false;
            "browser.newtabpage.activity-stream.topSitesRows" = 0;
            "browser.urlbar.quickactions.enabled" = true;
            "browser.safebrowsing.malware.enabled" = false;
            "browser.search.hiddenOneOffs" = "Google,Yahoo,Bing,Amazon.com,Twitter";
            "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
            "browser.urlbar.trimURLs" = false;
            "browser.ping-centre.telemetry" = false;
            "browser.urlbar.suggest.bookmark" = false;
            "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "browser.urlbar.suggest.searches" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "experiments.activeExperiment" = false;
            "experiments.enabled" = false;
            "experiments.supported" = false;
            "network.allow-experiments" = false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "extensions.pocket.enabled" = false;
            "extensions.pocket.api" = "";
            "extensions.pocket.oAuthConsumerKey" = "";
            "extensions.pocket.showHome" = false;
            "extensions.pocket.site" = "";
            "dom.events.asyncClipboard.clipboardItem" = true;
            "trailhead.firstrun.didSeeAboutWelcome" = true;
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "widget.use-xdg-desktop-portal.location" = 1;
            "widget.use-xdg-desktop-portal.mime-handler" = 1;
            "widget.use-xdg-desktop-portal.open-uri" = 1;
            "widget.use-xdg-desktop-portal.settings" = 1;
            "privacy.donottrackheader.value" = 1;
            "findbar.modalHighlight" = true;
            "datareporting.healthreport.uploadEnabled" = false;
          };
        };
      };

      programs.firefoxpwa.enable = true;
    };

  };

}
