{ inputs, config, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono Bold";
    };
    settings = with config.colorScheme.palette; {
      foreground = "#${base05}";
      background = "#${base00}";
      cursor     = "#${base05}";
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
    #theme = "One Dark";
  };
}
