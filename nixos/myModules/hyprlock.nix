{ config, inputs, pkgs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: 
{
  imports = [
    inputs.hyprlock.homeManagerModules.hyprlock
  ];

  programs.hyprlock = {
    enable = true;

    general = {
      disable_loading_bar = true;
      grace = 5;
    };

    backgrounds = [
      {
        monitor = "";
        path = "screenshot";
        blur_passes = 2;
        vibrancy = 0.3;
      }
    ];

    input-fields = [
      {
        size = {
          width = 400;
          height = 60;
        };

        outline_thickness = 2;

        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;

        outer_color = "rgb(34, 36, 45)";
        inner_color = "rgb(34, 36, 45)";
        font_color = "rgb(218, 219, 234)";

        placeholder_text = "";

        check_color = "rgb(#33CCFF)";
        fail_color = "rgb(#EB0740)";
      }
    ];

    labels = [
      {
        monitor = "";
        text =
        ''
          cmd[update:1000] echo "<span>$(${lib.getExe' pkgs.coreutils-full "date"} '+%H:%M %p')</span>"
        '';
        font_family = "JetBrainsMono Nerd Font";
        font_size = 120;
        color = "rgb(218, 219, 234)";

        position = {
          x = 50;
          y = -240;
        };

        valign = "top";
        halign = "center";
      }
    ];

  };
}
