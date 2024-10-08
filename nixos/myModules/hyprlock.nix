{ config, inputs, pkgs, lib, specialArgs, options, modulesPath, nixosConfig, osConfig }: 
{

  programs.hyprlock = {
    enable = true;

    settings = {

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

        outer_color = "rgb(${config.colorScheme.palette.base0D})";
        inner_color = "rgb(${config.colorScheme.palette.base00})";
        font_color = "rgb(${config.colorScheme.palette.base07})";

        placeholder_text = "";

        check_color = "rgb(${config.colorScheme.palette.base0B})";
        fail_color = "rgb(${config.colorScheme.palette.base08})";
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
        color = "rgb(${config.colorScheme.palette.base0D})";

        position = {
          x = 0;
          y = -250;
        };

        valign = "top";
        halign = "center";
      }
    ];

  };
  };
}
