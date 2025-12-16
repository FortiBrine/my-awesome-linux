{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "uk" ];
    policies = {
      DisableTelemetry = true;

      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        # Забороняємо всі інші розширення
        "*".installation_mode = "blocked";

        # ✅ uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };

        # ✅ Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url       = moz "privacy-badger17";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };

        # ✅ Dark Reader
        "addon@darkreader.org" = {
          install_url       = moz "darkreader";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };

        "ultimatedark@medv.io" = {
          install_url       = moz "ultimadark";
          installation_mode = "force_installed";
          updates_disabled  = false;
        };
      };
    };
  };

}



