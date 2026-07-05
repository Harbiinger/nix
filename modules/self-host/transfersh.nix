{ den, ... }: {

  den.aspects.transfersh = {

    nixos = { lib, ... }: {
      services.transfer-sh = {
        enable = true;
        settings = {
          basedir = "/home/transfersh/";
          listener = ":8080";
          http-auth-user = "cyrilmoreau";
          http-auth-pass = "cyrilmoreau";
          max-upload-size = "1000";
          purge-days = 5;
          purge-interval = 12;
          email-contact = "theo.godin@protonmail.com";
        };
      };
    };

  };

}
