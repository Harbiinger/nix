{ config, pkgs, ... }:

{
  home.username = "theo";
  home.homeDirectory = "/home/theo";
  home.stateVersion = "23.05";
  home.pointerCursor = {
    gtk.enable = true;
    #package = pkgs.bibata-cursors;
    #name = "Bibata-Modern-Ice";
    package = pkgs.banana-cursor;
    name = "Banana";
    size = 24;
  };
  home.sessionVariables = {
    EDITOR="nvim";
  };

  programs.waybar = {
    enable = true;
    #package = pkgs.waybar.overrideAttrs (oldAttrs: {
    #  mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #}); 
  };

  programs.vim = {
    enable = true;
    settings = { ignorecase = true; number = true; };
  };
}
