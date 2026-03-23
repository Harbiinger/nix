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
    ./myModules/newsboat.nix
    ./myModules/starship.nix
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
  # colorScheme = inputs.nix-colors.colorSchemes.eva; 
  # colorScheme = inputs.nix-colors.colorSchemes.gruvbox-light-medium;
  colorScheme = inputs.nix-colors.colorSchemes.apathy;
  # colorScheme = inputs.nix-colors.colorSchemes.framer;
  # colorScheme = {
  #   slug = "starwars";
  #   name = "starwars";
  #   author = "Theo Godin";
  #   palette = {
  #     base00 = "#020d5c";
  #     base01 = "#020d5c";
  #     base02 = "#041E58";
  #     base03 = "#042358";
  #     base04 = "#052757";
  #     base05 = "#ebfeff";
  #     base06 = "#ebfeff";
  #     base07 = "#ebfeff";
  #     base08 = "#fd6c3d";
  #     base09 = "#bc3320";
  #     base0A = "#fdfa53";
  #     base0B = "#46f8fc";
  #     base0C = "#46f8fc";
  #     base0D = "#46f8fc";
  #     base0E = "#6870f7";
  #     base0F = "#7b4225";
  #   };
  # };
  

  # default apps
  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["nvim.desktop"];
    "application/pdf" = ["mullvad-browser.desktop"];
    "video/*" = ["mpv.desktop"];
  };

  # vim
  programs.vim = {
    enable = true;
    settings = { ignorecase = true; number = true; };
  };

  programs.git = {
    enable = true;
    settings.user = {
      email = "theo.godin@protonmail.com";
      name = "harbiinger";
    };
  };
}
