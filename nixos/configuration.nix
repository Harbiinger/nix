# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable swap on luks
  boot.initrd.luks.devices."luks-2dd5b8dd-1da7-4e74-9ac0-55eda27a4259".device = "/dev/disk/by-uuid/2dd5b8dd-1da7-4e74-9ac0-55eda27a4259";

  # Nixos 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Network
  networking.hostName = "nixos"; # Define your hostname.

  # TMP 
  networking.firewall.allowPing = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Hyprland
  programs.hyprland.enable = true;
  security.pam.services.swaylock = {};
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland 
    ];
    xdgOpenUsePortal = true;
    config.common.default = [ "hyprland" ];
  };

  # Pirewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # alsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable thermald to proactively prevents overheating on Intel CPU.
  services.thermald.enable = true;

  services.upower.enable = true;

  # Enable TLP for battery optimization
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      PLATFORM_PROFILE_ON_AC= "performance";
      PLATFORM_PROFILE_ON_BAT= "low-power";

      RUNTIME_PM_ON_AC = "auto";
      RUNTIME_PM_ON_BAT = "auto";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      START_CHARGE_THRESH_BAT0 = 79; 
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  # Homemanager
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.theo = ./home.nix;
  };

  # NvChad
  nixpkgs = {
    overlays = [
      (final: prev: {
        nvchad = inputs.nvchad4nix.packages."${pkgs.system}".nvchad;
      })
    ];
  };

  # vial 
  services.udev.packages = with pkgs; [
    vial
    qmk-udev-rules
  ];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    gamescopeSession.enable = true;
  };

  # Jellyfin
  services.jellyfin = {
    enable = true;
  };
 
  # Flatpak
  services.flatpak.enable = true;

  # Virtual Box
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "theo" ];
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.vmware.host.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  # Wireshark
  programs.wireshark.enable = true;

  # Syncthing
  services.syncthing = {
    enable = true;
    user = "theo";
    dataDir = "/home/theo/Documents";
    configDir = "/home/theo/.config/syncthing"; 
  };
 
  # Mullvad
  services.resolved.enable = true;

  # Tailscale
  services.tailscale.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.theo = {
    isNormalUser = true;
    description = "Theo";
    extraGroups = [ "networkmanager" "wheel" "docker" "dialout" ];
    packages = with pkgs; [
      nautilus
      rofi
      keepassxc
      freetube
      eza
      bat
      swww
      signal-desktop
      # jq grim slurp wl-copy  -> hyprland_interactive_screenshot
      jq
      grim
      slurp
      wl-clipboard
      dunst
      pavucontrol
      teamspeak6-client
      ungoogled-chromium
      btop
      gimp3
      mpv
      ranger
      swaylock-effects
      hugo
      qbittorrent
      element-desktop
      discord
      stoat-desktop
      brightnessctl
      pulseaudioFull
      mpd
      libnotify
      godot_4
      font-awesome
      appimage-run
      javaPackages.compiler.openjdk25
      maven
      # jdk17
      # jdk21
      flatpak
      aircrack-ng
      baobab # disk usage analyzer
      prismlauncher
      tcpdump
      nmap
      wireshark
      termshark
      libreoffice
      gzdoom
      burpsuite
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
      papirus-icon-theme
      ncmpcpp
      fastfetch
      pamixer
      pkgsi686Linux.gperftools # required for hl2dm
      unzip
      feather
      tor-browser
      mullvad-vpn
      mullvad-browser
      blockbench
      unrar
      steamcmd
      ffmpeg
      zip
      spotdl
      # heroic
      zed-editor
      nodejs_25
      nerd-fonts.jetbrains-mono
      blender
      vial
      go
      # aseprite
      calibre
      obsidian
      audacity
      cisco-packet-tracer_9
      cool-retro-term
      vlc
      xdg-utils
      # super-productivity
      # zulip
      kdePackages.kdenlive
      arduino-ide
      mindustry
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    home-manager
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
    xwayland
  ];

  system.stateVersion = "23.05";
}
