# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  #boot.initrd.secrets = {
  #  "/crypto_keyfile.bin" = null;
  #};

  # Enable swap on luks
  #boot.initrd.luks.devices."luks-8f9fb7cc-979d-4bef-be7e-e7f2fe88555c".device = "/dev/disk/by-uuid/8f9fb7cc-979d-4bef-be7e-e7f2fe88555c";
  #boot.initrd.luks.devices."luks-8f9fb7cc-979d-4bef-be7e-e7f2fe88555c".keyFile = "/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-2dd5b8dd-1da7-4e74-9ac0-55eda27a4259".device = "/dev/disk/by-uuid/2dd5b8dd-1da7-4e74-9ac0-55eda27a4259";
  #boot.initrd.luks.devices."luks-2dd5b8dd-1da7-4e74-9ac0-55eda27a4259".keyFile = "/crypto_keyfile.bin";

  # Nixos 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Network
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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

      START_CHARGE_THRESH_BAT0 = 40; 
      STOP_CHARGE_THRESH_BAT0 = 85;
    };
  };

  # Homemanager
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.theo = ./home.nix;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    gamescopeSession.enable = true;
  };
 
  # Flatpak
  services.flatpak.enable = true;

  # Virtual Box
  #virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = [ "theo" ];

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
  #networking.iproute2.enable = true; 
  #networking.firewall.checkReversePath = "loose";
  #services.mullvad-vpn.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.theo = {
    isNormalUser = true;
    description = "Theo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      neovim
      nautilus
      #librewolf
      rofi-wayland
      keepassxc
      neofetch
      freetube
      eza
      bat
      swww
      eww
      signal-desktop
      # jq grim slurp wl-copy  -> hyprland_interactive_screenshot
      jq
      grim
      slurp
      wl-clipboard
      dunst
      pavucontrol
      teamspeak_client
      ungoogled-chromium
      btop
      gimp
      mpv
      ranger
      swaylock-effects
      hugo
      qbittorrent
      element-desktop
      discord
      brightnessctl
      pulseaudioFull
      mpd
      libnotify
      godot_4
      font-awesome
      appimage-run
      jdk21
      flatpak
      aircrack-ng
      baobab # disk usage analyzer
      prismlauncher
      R
      rstudio
      tcpdump
      nmap
      wireshark
      termshark
      libreoffice
      gzdoom
      burpsuite
      xorg.libXtst
      newsflash
      # logseq
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
      mullvad-browser
      blockbench
      unrar
      gtkradiant
      steamPackages.steamcmd
      ffmpeg
      zip
      spotdl
      wineWowPackages.staging
      heroic
      gamescope
      protonup-qt
      zed-editor
      nodejs_22 # for copilot
    ];
  };

  # Allow unfree packages
  #nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
    mullvad-vpn
    cron
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
