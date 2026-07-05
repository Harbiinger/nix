{ den, inputs, ... }:
{

  den.aspects.catodoro = {

    nixos = {
      imports = [ inputs.catodoro.nixosModules.default ];

      services.catodoro = {
        enable = true;
        bind = "127.0.0.1:8002";
        allowedHosts = [ "catodoro.com" ];
      };

      services.caddy = {
        enable = true;
        virtualHosts = {
          "catodoro.com".extraConfig = ''
            tls theo.godin@protonmail.com
            reverse_proxy localhost:8002
          '';
        };
      };
    };

  };


}

