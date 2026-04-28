{ den, inputs, ... }:
{

  den.aspects.theo = {

    includes = [
      den.provides.primary-user
      den.aspects.kitty
      den.aspects.vim
      den.aspects.steam
      den.aspects.nvchad
      den.aspects.hyprland
      den.aspects.p137-storage
    ];

    nixos =
      { pkgs, ... }:
      {

        nixpkgs.config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-38.8.4" ];
        };

        users.users.theo = {
          isNormalUser = true;
          description = "Theo";
          extraGroups = [
            "networkmanager"
            "wheel"
            "docker"
            "dialout"
          ];

          packages = with pkgs; [
            discord
            teamspeak6-client
            stoat-desktop
            freetube
            blockbench
            heroic
            super-productivity
            burpsuite
            unrar
            obsidian
          ];
          
        };

      };

    homeManager =
      { pkgs, ... }:
      {

        imports = [
          inputs.nix-colors.homeManagerModules.default
        ];

        colorScheme = inputs.nix-colors.colorSchemes.eva;

        home = {
          pointerCursor = {
            gtk.enable = true;
            package = pkgs.banana-cursor;
            name = "Banana";
            size = 24;
          };

          packages = with pkgs; [
            btop
            nautilus
            keepassxc
            signal-desktop
            eza
            bat
            swww
            jq
            grim
            slurp
            wl-clipboard
            dunst
            pavucontrol
            ungoogled-chromium
            gimp3
            mpv
            ranger
            swaylock-effects
            hugo
            qbittorrent
            element-desktop
            brightnessctl
            pulseaudioFull
            mpd
            libnotify
            godot
            appimage-run
            javaPackages.compiler.openjdk25
            maven
            # jdk17
            # jdk21
            flatpak
            baobab # disk usage analyzer
            prismlauncher
            tcpdump
            nmap
            wireshark
            termshark
            libreoffice
            gzdoom
            libXtst
            rustup
            # pkgs.slade # Doom map maker
            # pkgs.doomseeker # Doom server broswer
            # pkgs.chocolate-doom # Doom port
            # pkgs.odamex # Doom port
            # pkgs-unstable.zandronum # Doom port
            vscodium
            thunderbird
            lutris
            obs-studio
            ncmpcpp
            fastfetch
            pamixer
            pkgsi686Linux.gperftools # required for hl2dm
            unzip
            feather
            tor-browser
            mullvad-vpn
            mullvad-browser
            ffmpeg
            zip
            zed-editor
            nodejs_25
            papirus-icon-theme
            vial
            go
            # aseprite
            calibre
            audacity
            # cisco-packet-tracer_9
            cool-retro-term
            vlc
            xdg-utils
            kdePackages.kdenlive
            arduino-ide
            niri
            noctalia-shell
            xwayland-satellite
            nixd
            nixfmt
            edopro
            (retroarch.withCores (cores: with libretro; [
              bsnes
            ]))
          ];
        };
      };

  };

}
