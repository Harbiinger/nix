{ inputs, config, pkgs, pkgs-unstable, lib, ... }:

{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./myModules/hyprland.nix
    ./myModules/waybar.nix
    ./myModules/hyprlock.nix
    ./myModules/kitty.nix
    ./myModules/rofi.nix
    ./myModules/dunst.nix
    ./myModules/wlogout.nix
    ./myModules/nvchad.nix
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
  # colorScheme = inputs.nix-colors.colorSchemes.da-one-sea;
  # colorScheme = inputs.nix-colors.colorSchemes.greenscreen;
  colorScheme = inputs.nix-colors.colorSchemes.eva; 

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

  programs.git = {
    enable = true;
    userEmail = "210170@umons.ac.be";
    userName = "Harbiinger";
  };
}
