{ den, ... }: {

  den.aspects.caddy = {

    nixos = { pkgs, ... }: {
      services.caddy = {
        enable = true;
        package = pkgs.caddy;

        virtualHosts = {
          "cercleinfo.space".extraConfig = ''
            tls theo.godin@protonmail.com
            reverse_proxy /.well-known/matrix/* 127.0.0.1:8008
          '';

          "matrix.cercleinfo.space".extraConfig = ''
            tls theo.godin@protonmail.com
            reverse_proxy /_matrix/* 127.0.0.1:8008
            reverse_proxy /.well-known/matrix/* 127.0.0.1:8008
          '';

          "ts.cercleinfo.space".extraConfig = ''
            reverse_proxy 0.0.0.0:30033
          '';

          "transfer.bariumgames.eu".extraConfig = ''
            tls theo.godin@protonmail.com
            reverse_proxy: 8080
          '';

          "gameboy.bariumgames.eu".extraConfig = ''
            root * /var/www/gameboy
            file server
          '';
        };
      };
    };

  };

}
