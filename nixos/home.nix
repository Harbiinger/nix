{ config, pkgs, pkgs-unstable, lib, ... }:

{

  imports = [
    /home/theo/GitHub/nix/nixos/myModules/waybar.nix
    /home/theo/GitHub/nix/nixos/myModules/hyprlock.nix
  ];

  home.username = "theo";
  home.homeDirectory = "/home/theo";
  home.stateVersion = "23.11";
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.banana-cursor;
    name = "Banana";
    size = 24;
  };

  home.sessionVariables = {
    EDITOR="nvim";
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["nvim.desktop"];
    "application/pdf" = ["librewolf.desktop"];
    "video/*" = ["mpv.desktop"];
  };

  programs.vim = {
    enable = true;
    settings = { ignorecase = true; number = true; };
  };
}
