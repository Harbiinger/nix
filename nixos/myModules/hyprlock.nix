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
      hide_cursor = true;
      ignore_empty_input = true;
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

        outer_color = "#${config.colorScheme.palette.base0D}";
        inner_color = "rgb(34, 36, 45)";
        font_color = "rgb(218, 219, 234)";

        placeholder_text = "";

        check_color = "#33CCFF";
        fail_color = "#${config.colorScheme.palette.base08}";
      }
    ];

    labels = [
      {
        monitor = "";
        text =
        ''
          cmd[update:1000] echo "<span>$(${lib.getExe' pkgs.coreutils-full "date"} '+%H:%M')</span>"
        '';
        font_family = "JetBrains Mono Bold";
        font_size = 80;
        color = "rgb(218, 219, 234)";

        position = {
          x = 0;
          y = -250;
        };

        valign = "top";
        halign = "center";
      }
    ];

  };
}
