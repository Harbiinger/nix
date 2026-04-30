{ den, ... }:
{

  den.aspects.starship = {

    homeManager =
      { lib, ... }:
      {
        programs.starship = {
          enable = true;
          settings = {
            add_newline = false;
            format = lib.concatStrings [ "$all" ];
            scan_timeout = 1000;
          };
        };
      };

  };

}
