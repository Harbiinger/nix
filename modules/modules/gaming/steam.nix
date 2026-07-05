{ den, ... }:
{

  den.aspects.steam = {

    includes = [
      (den.provides.unfree [
        "steam"
        "steamcmd"
        "steam-unwrapped"
      ])
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          steamcmd
        ];
      };

    nixos =
      { ... }:
      {
        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;
        };

        hardware.steam-hardware.enable = true;
      };

  };

}
