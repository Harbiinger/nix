{ config, ... }: 
{
  services.dunst = {
    enable = true;
    settings = with config.colorScheme.palette; {
      global = {
        follow = "mouse";
        indicate_hidden = true;
        offset = "10x10";
        notification_height = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 2;
        frame_color = "#${base0D}";
        separator_color = "frame";
        sort = true;
        idle_treshold = 120;
        font = "JetBrains Mono Bold 10";
        line_height = 0;
        markup = "full";
        alignment = "left";
        vertical_alignment = "center";
        show_age_treshold = 60;
        word_warp = true;
        stack_duplicate = true;
        hide_duplicate_count = false;
        show_indicators = true;
        min_icon_size = 0;
        max_icon_size = 64;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        timeout = 10;
      };

      urgency_low = {
        background = "#${base00}";
        foreground = "#${base07}";
        frame_color = "#${base0B}";
      };

      urgency_normal = {
        background = "#${base00}";
        foreground = "#${base07}";
        frame_color = "#${base0D}";
      };

      urgency_critical = {
        background = "#${base00}";
        foreground = "#${base07}";
        frame_color = "#${base08}";
      };

    };
  };
}
