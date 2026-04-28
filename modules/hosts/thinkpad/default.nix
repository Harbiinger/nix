{ den, ... }:
{

  den.hosts.x86_64-linux.thinkpad.users.theo = { };

  den.aspects.thinkpad = {

    includes = [
      den.aspects.battery
      den.aspects.bluetooth
      den.aspects.pipewire
      den.aspects.i18n
      den.aspects.jellyfin
    ];

    nixos =
      { pkgs, ... }:
      {

        imports = [
          ./_hardware-configuration.nix
        ];

        # Bootloader.
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        # Enable swap on luks
        boot.initrd.luks.devices."luks-2dd5b8dd-1da7-4e74-9ac0-55eda27a4259".device =
          "/dev/disk/by-uuid/2dd5b8dd-1da7-4e74-9ac0-55eda27a4259";

        # Nixos
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];

        # Enable networking
        networking.networkmanager.enable = true;
        networking.firewall.allowPing = true;

        # Set your time zone.
        time.timeZone = "Europe/Brussels";

        # Configure keymap in X11
        services.xserver.xkb = {
          layout = "us";
          variant = "";
        };

        # vial
        services.udev.packages = with pkgs; [
          vial
          qmk-udev-rules
        ];

        xdg.portal = {
          enable = true;
          extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
            xdg-desktop-portal-hyprland
          ];
          xdgOpenUsePortal = true;
          config.common.default = [ "gtk" ];
        };
        xdg.mime.defaultApplications = {
          "text/plain" = [ "nvim.desktop" ];
          "application/pdf" = [ "mullvad-browser.desktop" ];
          "video/*" = [ "vlc.desktop" ];
          "image/*" = [ "mullvad-browser.desktop" ];
        };
        services.flatpak.enable = true;

        # Virtual Box
        virtualisation.virtualbox.host.enable = true;
        users.extraGroups.vboxusers.members = [ "theo" ];

        # Docker
        virtualisation.docker.enable = true;
        virtualisation.podman.enable = true;

        # Wireshark
        programs.wireshark.enable = true;

        # Syncthing
        services.syncthing = {
          enable = true;
          user = "theo";
          configDir = "/home/theo/.config/syncthing";
        };

        # Mullvad
        services.resolved.enable = true;

        # Tailscale
        services.tailscale.enable = true;

        # Fonts
        fonts.packages = with pkgs; [
          nerd-fonts.jetbrains-mono
          # font-awesome
          # open-sans
        ];

        # List packages installed in system profile.
        environment.systemPackages = with pkgs; [
          vim
          wget
          gcc
          cmake
          git
          meson
          ninja
          networkmanager
          python3
          cron
        ];

      };
  };

}
