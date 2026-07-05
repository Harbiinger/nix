{ den, ... }: {

  den.aspects.protonmail = {

    nixos = { ... }: {
      services.protonmail-bridge.enable = true;
    };

  };

  }
