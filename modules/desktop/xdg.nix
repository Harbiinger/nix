{ den, ... }:
{

  den.aspects.xdg = {

    provides.to-hosts.nixos =
      { pkgs, config, ... }:
      {
        xdg.portal = {
          enable = true;
          extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
          ];
          xdgOpenUsePortal = true;
          config.common.default = [ "gtk" ];
        };
        xdg.mimeApps.defaultApplications = {
          "text/plain" = [ "nvim.desktop" ];
          "application/pdf" = [ "mullvad-browser.desktop" ];
          "video/*" = [ "vlc.desktop" ];
        };
      };

  };

}
