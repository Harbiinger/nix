{ den, ... }:
{

  den.aspects.pipewire = {

    nixos =
      { ... }:
      {
        security.rtkit.enable = true;
        services.pipewire = {
          enable = true;
          pulse.enable = true;
        };
      };

  };

}
