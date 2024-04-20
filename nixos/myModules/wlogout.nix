{ inputs, config, lib, ... }:
{
  programs.wlogout = {

    enable = true;

    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = with config.colorScheme.palette; ''
window {
    font-family: JetBrains Mono Bold;
    font-size: 14pt;
    color: #${base04}; /* text */
    background-color: rgba(30, 30, 46, 0.5);
}

button {
    background-repeat: no-repeat;
    background-position: center;
    background-size: 25%;
    border: none;
    background-color: rgba(30, 30, 46, 0);
    margin: 5px;
    transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
}

button:hover {
    background-color: rgba(49, 50, 68, 0.1);
}

button:focus {
    background-color: #${base0D};
    color: #${base07};
}

#lock {
    background-image: image(url("./wlogoutImages/lock.png"));
}
#lock:focus {
    background-image: image(url("./wlogoutImages/lock-hover.png"));
}

#logout {
    background-image: image(url("./wlogoutImages/logout.png"));
}
#logout:focus {
    background-image: image(url("./wlogoutImages/logout-hover.png"));
}

#suspend {
    background-image: image(url("./wlogoutImages/sleep.png"));
}
#suspend:focus {
    background-image: image(url("./wlogoutImages/sleep-hover.png"));
}

#shutdown {
    background-image: image(url("./wlogoutImages/power.png"));
}
#shutdown:focus {
    background-image: image(url("./wlogoutImages/power-hover.png"));
}

#reboot {
    background-image: image(url("./wlogoutImages/restart.png"));
}
#reboot:focus {
    background-image: image(url("./wlogoutImages/restart-hover.png"));
}
    '';

  };
}
