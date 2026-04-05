{ den, ... }:
{

  den.aspects.jellyfin = {

    nixos.services.jellyfin = {
      enable = true;
    };

  };

}
