{ den, ... }:
{

  den.aspects.immich = {

    nixos.services.immich = {
        enable = true;
        port = 2283;
        openFirewall = true;
        user = "immich";
    };

  };

}
