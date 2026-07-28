{ den, ... }: 
{

  den.aspects.dwm = {
    
    nixos = {
      services.xserver = {
        enable = true;   

        libinput = {
          enable = true;
          mouse.accelProfile = "flat";
          touchpad.accelProfile = "flat";
        };

        windowManager.dwm.enable = true;
        displayManager.startx = {
          enable = true;
          generateScript = true;
        };
      };

    };

    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        dwm
        dmenu
      ];
    };

  };

}
