{ den, ... }:
{

  den.aspects.jellyfin = {

    nixos = { ... }: {
      services.jellyfin = {
        enable = true;
      };

      services.caddy = {
        enable = true;
        virtualHosts = {
          "jellyfin-nixos.home".extraConfig = ''
            tls internal
            reverse_proxy localhost:8096
          '';
        };
      };
    };

  };

}
