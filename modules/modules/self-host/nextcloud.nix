{ den, ... }: {

  den.aspects.nextcloud = {

    nixos = { config, ... }: {
      environment.etc."nextcloud-admin-pass".text = "lrp2ulrp2u";

      services.nextcloud = {
        enable = true;
        hostName = "localhost";
        config = {
          adminpassFile = "/etc/nextcloud-admin-pass";
          dbtype = "sqlite";
        };

        extraApps = {
          inherit (config.services.nextcloud.package.packages.apps) calendar;
        };

        extraAppsEnable = true;

        settings = {
          default_phone_region = "BE";

          mail_smtpmode = "smtp";
          mail_smtphost = "webmail.your-server.de";
          mail_smtpport = 993;
          mail_smtpauth = true;
          mail_smtpsecure = "ssl";
          mail_smtpname = "thegod@projet137.com";
          mail_from_address = "thegod";
          mail_domain = "projet137.com";
        };
      };

      services.nginx.virtualHosts."${config.services.nextcloud.hostName}".listen = [ { addr = "127.0.0.1"; port = 8080; } ];
    };

  };

}
