{ den, ... }:
{

  den.aspects.kitty = {

    includes = [
      den.aspects.starship
    ];

    homeManager =
      { config, ... }:
      {
        programs.kitty = {
          enable = true;
          font = {
            name = "JetBrains Mono Bold";
          };
          #extraConfig = "font SF Distant Galaxy Regular 8";
          settings = with config.colorScheme.palette; {
            foreground = "#${base07}";
            background = "#${base00}";
            background_opacity = 0.5;
            #background_image = "/home/theo/Pictures/Wallpapers/nixos.png";
            cursor = "#${base05}";
            cursor_trail = 3;
            selection_foreground = "#${base00}";
            selection_background = "#${base05}";
            confirm_os_window_close = 0;
            # normal
            color0 = "#${base00}";
            color1 = "#${base08}";
            color2 = "#${base0B}";
            color3 = "#${base0A}";
            color4 = "#${base0D}";
            color6 = "#${base0C}";
            color7 = "#${base05}";
            # bright
            color8 = "#${base03}";
            color9 = "#${base09}";
            color10 = "#${base01}";
            color11 = "#${base02}";
            color12 = "#${base04}";
            color13 = "#${base06}";
            color14 = "#${base0F}";
            color15 = "#${base07}";

          };
        };
      };
  };
}
