{ inputs, config, pkgs, pkgs-unstable, lib, ... }:

{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./myModules/waybar.nix
    ./myModules/hyprlock.nix
    ./myModules/kitty.nix
  ];

  # home
  home.username = "theo";
  home.homeDirectory = "/home/theo";
  home.stateVersion = "23.11";
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.banana-cursor;
    name = "Banana";
    size = 24;
  };

  # session variables
  home.sessionVariables = {
    EDITOR="nvim";
  };

  # nix-colors
  colorScheme = inputs.nix-colors.colorSchemes.onedark;

  # default apps
  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["nvim.desktop"];
    "application/pdf" = ["librewolf.desktop"];
    "video/*" = ["mpv.desktop"];
  };

  # vim
  programs.vim = {
    enable = true;
    settings = { ignorecase = true; number = true; };
  };
}
