# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  # Enable swap on luks
  boot.initrd.luks.devices."luks-8f9fb7cc-979d-4bef-be7e-e7f2fe88555c".device = "/dev/disk/by-uuid/8f9fb7cc-979d-4bef-be7e-e7f2fe88555c";
  boot.initrd.luks.devices."luks-8f9fb7cc-979d-4bef-be7e-e7f2fe88555c".keyFile = "/crypto_keyfile.bin";

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

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
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
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
};

  # Homemanager
  home-manager = {
    useUserPackages = true;
    users.theo = import ./home.nix;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
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
      kitty
      neovim
      gnome.nautilus
      librewolf
      rofi-wayland
      keepassxc
      neofetch
      freetube
      eza
      bat
      swww
      eww-wayland
      signal-desktop
      # jq grim slurp wl-copy  -> hyprland_interactive_screenshot
      jq
      grim
      slurp
      wl-clipboard
      dunst
      pavucontrol
      teamspeak_client
      #ungoogled-chromium
      chromium
      btop
      gimp
      mpv
      ranger
      wlogout
      swaylock-effects
      hugo
      qbittorrent
      element-desktop
      discord
      brightnessctl
      pulseaudioFull
      mpd
      libnotify
      unstable.godot_4
      font-awesome
      appimage-run
      youtube-dl
      jdk17
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
      racket
      teamspeak5_client
      unstable.xorg.libXtst
      nom
      newsflash
      unstable.logseq
      rustup
      watershot
      slade
      doomseeker
      chocolate-doom
      odamex
      unstable.zandronum
      unstable.vscodium
      gomuks
      thunderbird
      iamb
      lutris
      wineWowPackages.waylandFull
      obs-studio
      protonup-qt 
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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
    python311
    unstable.mullvad-vpn
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
