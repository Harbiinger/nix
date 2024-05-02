{ config, inputs, pkgs, lib, ... }:
{

  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      # inputs.Hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    settings = {
      # default
      monitor = [ 
        ", preferred, auto, 1"
        # gaming
        # "eDP-1, disable"
      ];
      # mirror
      # monitor = ". preferred, auto, 1, mirror, eDP-1";

      exec-once = [
        "dunst --config /home/theo/.config/dunst/dunstsrc"
        "waybar"
        "eww daemon"
        "swww init"
        "mpd"
      ];

      windowrule = [
        "float, rofi"
        "opaque, rofi"
        "opaque, freetube"
        "opaque, libreworlf"
        "opaque, signal"
        "opaque, Discord"
        "opaque, kitty"
      ];

      env = [
        "WLR_NO_HARDWARE_CURSORS, 1"
      ];

      input = {
        kb_layout = "us, be";
        kb_options = "grp:alt_shift_toggle";
        accel_profile = "flat";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
          disable_while_typing = false;
        };
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(${config.colorScheme.palette.base0D}ff)";
        "col.inactive_border" = "rgba(00000000)";
        layout = "dwindle";
      };

      misc = {
        force_default_wallpaper = 0;
      };

      decoration = {
        rounding = 10;
        active_opacity = 0.9;
        inactive_opacity = 0.9;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
        };

        drop_shadow = false;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = [
          "pace, 0.46, 1, 0.29, 0.99"
          "overshot, 0.13, 0.99, 0.29, 1.1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
        ];
        animation = [
          "windowsIn, 1, 6, md3_decel, slide"
          "windowsOut, 1, 6, md3_decel, slide"
          "windowsMove, 1, 6, md3_decel, slide"
          "fade, 1, 10, md3_decel"
          "workspaces, 1, 7, md3_decel, slide"
          "border, 0, 3, md3_decel"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      plugin = {
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, Return, exec, kitty"
        "$mainMod, S, exec, ~/bin/screenshot"
        "$mainMod SHIFT, S, exec, ~/bin/fast-screenshot"
        "$mainMod, E, exec, kitty -e ranger"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod, F, fullscreen,"
        "$mainMod, T, toggleopaque"
        "$mainMod SHIFT, A, exec, ~/bin/lock_transparent.sh"
        "$mainMod SHIFT, E, exec, ~/.config/hypr/scripts/wlogout.sh "
        "$mainMod SHIFT, Space, togglefloating,"
        "$mainMod, Space, pin,"
        "$mainMod, V, togglesplit,"
        "$mainMod, p, exec, ~/bin/wallpaper.sh"
        "$mainMod, M, exec, kitty -e ncmpcpp"

        ",233, exec, brightessctl set +5%"
        ",232, exec, brightnessctl set 5%-"
        ",121, exec, pamixer -t" # mute sound F1


        "$mainMod SHIFT,b, swapnext, prev"
        "$mainMod SHIFT,n, swapnext,"
        "$mainMod SHIFT, m, swapactiveworkspaces, eDP-1 HDMI-A-1"

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # "$mainMod, TAB, overview:toggle,"
      ];
      
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

    };
  };
}
