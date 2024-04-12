{ inputs, config, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono Bold";
    };
    settings = with config.colorScheme.palette; {
      # foreground = "#${base07}";
      # background = "#${base00}";
      # cursor     = "#${base05}";
      # color0     = "#${base00}";
      # color1     = "#${base01}";
      # color2     = "#${base02}";
      # color3     = "#${base03}";
      # color4     = "#${base04}";
      # color5     = "#${base05}";
      # color6     = "#${base06}";
      # color7     = "#${base07}";
      # color8     = "#${base08}";
      # color9     = "#${base09}";
      # color10    = "#${base0A}";
      # color11    = "#${base0B}";
      # color12    = "#${base0C}";
      # color13    = "#${base0D}";
      # color14    = "#${base0E}";
      # color15    = "#${base0F}";
      # selection_foreground = "#${base00}";
      # selection_background = "#${base07}";
       confirm_os_window_close = 0;
    };
    theme = "One Dark";
  };
}
