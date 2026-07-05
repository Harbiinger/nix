{ den, ... }: {


  den.aspects.desktop = {

    includes = with den.aspects; [
      firefox
      hyprland
      kitty
    ];

  };

}
