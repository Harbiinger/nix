{ inputs, config, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {

      myBar = {

        layer = "top";
        position = "top";
        height = 0;

        modules-left = [
          "custom/nix-logo"
          "hyprland/workspaces"
          "tray"
          "mpd"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "custom/powermenu"
        ];

        "tray" = {
          icon-size = 16;
          spacing = 10;
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = ["  " "  " "  "];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        "battery" = {
          format-charging = " 󰂄 {capacity}%"; 
          format = " 󰁹 {capacity}%";
          states = [
            "warning: 30"
            "critical: 15"
          ];
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          on-click = true;
        };

        "clock" = {
          format = "  {:%R    %d/%m}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "network" = {
          format-wifi = " 直 {essid}";
          format-ethernet = "  {ipaddr}";
          format-disconnected = " 睊 Disconnected";
          tooltip-format-wifi = "Signal Strenght: {signalStrength}% | Down Speed: {bandwidthDownBits}, Up Speed: {bandwidthUpBits}";
          on-click = "~/GitHub/nix/nixos/myModules/scripts/toggleWifi.sh";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "   Muted";
          format-bluetooth = " 󰥰 {volume}%";
          scroll-step = 1;
          format-icons = {
            headphone = "  ";
            hands-free = "  ";
            headset = "  ";
            default = ["  " "  " " 墳" "  "];
            };
          on-click = "pamixer -t";
        };

        "cpu" = {
          interval = 10;
          format = " 󰻠 {}%";
        };

        "memory" = {
          interval = 10;
          format = "  {}%";
        };

        "custom/powermenu" = {
          format = "  ";
          on-click = "eww open menu --toggle";
        };

        "custom/nix-logo" = {
            format = " 󱄅 ";
        };

        "mpd" = {
          format = "   {title} {stateIcon}";
          format-stopped = "  ";
          format-disconnected = " 󰚦 ";
          state-icons = {
            paused = "  ";
            playing = "  ";
          };
        };

      };
    };

    style = ''
* {
    border: none;
    border-radius: 0;
    font-family: JetBrains Mono Bold;
    font-weight: bold;
    font-size: 14px;
    min-height: 0;
}

window#waybar {
    background: rgba(21, 18, 27, 0);
    color: #${config.colorScheme.palette.base00};
}

#tooltip {
    background: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base00};
    border-radius: 10;
    border-width: 2px;
    border-style: solid;
    border-color: #${config.colorScheme.palette.base0D};
}

#workspaces button {
    padding: 5px;
    color: #${config.colorScheme.palette.base0D};
    margin-right: 5px;
}

#workspaces button.active {
    color: #${config.colorScheme.palette.base07};
}

#workspaces button.focused {
    color: #${config.colorScheme.palette.base08};
}

#workspaces button.urgent {
    color: #${config.colorScheme.palette.base0F};
}

#workspaces button:hover {
    background: #${config.colorScheme.palette.base0D};
    color: #${config.colorScheme.palette.base07};
}

#window,
#clock,
#battery,
#backlight,
#pulseaudio,
#network,
#workspaces,
#tray,
#cpu,
#temperature,
#memory,
#custom-powermenu,
#custom-nix-logo,
#mpd {
    background: #${config.colorScheme.palette.base00};
    color: #${config.colorScheme.palette.base0D};
    padding: 0px 10px;
    margin: 3px 0px;
    margin-top: 0px;
    padding-top: 2px;
    padding-bottom: 2px;
    border: 1px solid #${config.colorScheme.palette.base0D};
    /* border tuning : 
    background: linear-gradient(to left, #222431, #222431) padding-box, linear-gradient(to top, rgba(51, 204, 255, 0.93), rgba(0, 255, 153, 0.93)) border-box;
    */
    border-radius: 0em;
    border-top: 0px;
}

#tray {
    border-radius: 0px 0px 0px 0px;
    margin-left: 0px;
    padding-right: 5px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#mpd {
    border-radius: 0px 0px 10px 0px;
    margin-left: 0px;
    padding-right: 5px;
    padding-left: 5px;
    border-left: 0px;
}

#workspaces {
    border-radius: 0px 0px 0px 0px;
    margin-left: 0px;
    padding-right: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right:0px;
}

#cpu {
    border-radius: 0px;
    margin-left: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#memory {
    border-radius: 0px;
    margin-left: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#temperature {
    border-radius: 0px;
    margin-left: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#custom-powermenu {
    border-radius: 0px;
    margin-left: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#custom-nix-logo {
    border-radius: 0px;
    margin-left: 0px;
    padding-left: 0px;
    padding-right: 5px;
    border-left: 0px;
    border-right: 0px;
    font-size: 22px;
}

#clock {
    border-radius: 0px 0px 10px 10px;
    margin-left: 10px;
}

#network {
    border-radius: 0px;
    margin-left: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#network.disconnected {
    color: #${config.colorScheme.palette.base08};
}

#pulseaudio {
    border-radius: 0px 0px 0px 10px;
    border-right: 0px;
}

#pulseaudio.muted {
    color: #${config.colorScheme.palette.base08};
}

#backlight {
    border-right: 0px;
    border-left: 0px;
}

#battery {
    border-radius: 0px 0px 0px 0px;
    margin-left: 0px;
    margin-right: 0px;
    padding-left: 5px;
    border-left: 0px;
    border-right: 0px;
}

#battery.warning {
    color: #${config.colorScheme.palette.base09};
}

#battery.critical {
    color: #${config.colorScheme.palette.base08};
}
    '';
  };
}
