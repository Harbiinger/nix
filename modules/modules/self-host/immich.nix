{ den, ... }:
{

  den.aspects.immich = {

    nixos = { ... }: {
      services.immich = {
        enable = true;
        host = "localhost";
        port = 2283;
        user = "immich";
        database.port = 6543;
      };

      services.caddy = {
        enable = true;
        virtualHosts = {
          "immich-nixos.home".extraConfig = ''
            tls internal
            reverse_proxy localhost:2283
          '';
        };
      };
    };

  };

}
