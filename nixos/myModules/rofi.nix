{ inputs, pkgs, config, ... }:
{
  programs.rofi = {
    enable = true;
    font = "JetBrainsMono Nerd Font Bold";

    theme = 
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in with config.colorScheme.palette; {
        "configuration" ={
          font = "JetBrainsMono Nerd Font Bold 11";
          show-icons = true;
          icon-theme = "Papirus";
          display-drun = "  ";
          drun-display-format = "{name}";
          disable-history = false;
          sidebar-mode = false;
        };

        "window" = {
          transparency = "real";
          background-color = mkLiteral "#${base00}";
          text-color = mkLiteral "#${base07}";
          border = mkLiteral "2px";
          border-color = mkLiteral "#${base0D}";
          border-radius = mkLiteral "12px";
          width = mkLiteral "18%";
          location = mkLiteral "center";
          x-offset = 0;
          y-offset = 0;
        };

        "prompt" = {
          enabled = true;
          padding = mkLiteral "0.3% 1% 0% 0.1%";
          background-color = mkLiteral "#${base0D}";
          text-color = mkLiteral "#${base00}";
        };

        "entry" = {
          background-color = mkLiteral "#${base0D}";
          text-color = mkLiteral "#${base00}";
          placeholder-color = mkLiteral "#${base00}";
          expand = true;
          horizontal-align = 0;
          placeholder = "Search";
          padding = mkLiteral "0.10% 0% 0% 0%";
          blink = true;
        };

        "inputbar" = {
          children = map mkLiteral [ "prompt" "entry" ];
          background-color = mkLiteral "#00000000";
          text-color = mkLiteral "#${base00}";
          expand = false;
          border = mkLiteral "0% 0% 0% 0%";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "#00000000";
          margin = mkLiteral "0% 0% 0% 0%";
          padding = mkLiteral "15px";
        };

        "listview" = {
          background-color = mkLiteral "#${base00}";
          padding = mkLiteral "0px";
          colums = 1;
          lines = 5;
          spacing = mkLiteral "0%";
          cycle = false;
          dynamic = true;
          layout = mkLiteral "vertical";
        };

        "mainbox" = {
          background-color = mkLiteral "#${base0D}";
          border = mkLiteral "0% 0% 0% 0%";
          border-radius = mkLiteral "0% 0% 0% 0%";
          border-color = mkLiteral "#00000000";
          children = map mkLiteral [ "inputbar" "listview" ];
          spacing = mkLiteral "0%";
          padding = mkLiteral "0%";
        };

        "element" = {
          background-color = mkLiteral "#${base00}";
          text-color = mkLiteral "#${base07}";
          orientation = mkLiteral "horizontal";
          border-radius = mkLiteral "0%";
          padding = mkLiteral "1% 0.5% 1% 0.5%";
        };

        "element-icon" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          horizontal-align = mkLiteral "0.5";
          vertical-align = mkLiteral "0.5";
          size = mkLiteral "32px";
          border = mkLiteral "0px";
        };

        "element-text" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          expand = true;
          horizontal-align = 0;
          vertical-align = mkLiteral "0.5";
          margin = mkLiteral "0% 0.25% 0% 0.25%";
        };

        "element selected" = {
          background-color = mkLiteral "#${base01}";
          text-color = mkLiteral "#${base07}";
          border = mkLiteral "0% 0% 0% 0%";
          border-radius = mkLiteral "0px";
          border-color = mkLiteral "#${base00}";
        };

      };

  };
}
