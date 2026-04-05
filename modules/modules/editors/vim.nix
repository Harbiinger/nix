{ den, ... }:
{

  den.aspects.vim = {

    homeManager =
      { ... }:
      {
        programs.vim = {
          enable = true;
          settings = {
            number = true;
          };
        };
      };
  };

}
