{ den, inputs, ... }: {

  den.hosts.x86_64-linux.vps.users = {

    matrix = {};
    quakelive = {};
    transfersh = {};

  };
  
  den.aspects.vps = {

    includes = with den.aspects; [
      caddy
      teamspeak
    ];
     
    nixos = { pkgs, ... }: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disk-config.nix
        ./_hardware-configuration.nix
      ];

      boot.loader.grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
      };

      time.timeZone = "Europe/Brussels";

      networking = {
        networkmanager.enable = true;
        interfaces.eth0 = {
          name = "eth0";
          ipv4.addresses = [{ 
            address = "185.216.27.8"; 
            prefixLength = 25;
          }];

          ipv6.addresses = [{ 
            address = "2a09:6383:0:11:185:216:27:8";
            prefixLength = 64;
          }];
        };

        defaultGateway = {
          address = "185.216.27.1";
          interface = "eth0";
        };

        firewall = {
          enable = true;
          allowedTCPPorts = [
            22    # ssh
            80    # http
            443   # tls
            8448  # matrix
            27960 # quake live
          ];

          allowedUDPPorts = [
            27960 # quake live
          ];
        };

        nameservers = [
          "9.9.9.9"
          "8.8.8.8"
        ];
      };

      services.openssh = {
        enable = true;
        settings.PermitRootLogin = "without-password";
      };

      users.users.root = {

        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeu4sMFkBPNDVgZES48SFQeYzq3LnqlnZOLP62XbWlUuFFT5yHlA/eLRe43v0eKxsApzOnlXBEWORCoWq3958MUaP9HIvaI21P5zjPQPkYco65WbdXJ1wkX+05EEvBnzHdERRY0K76gxjlPgf7OVbZIntdE1atZURwCoBarXjVZU1ux/RVelBcR/KawQZUkN12IrD78l+/C86AjHwlGVk1RR1eEkW1D8S9zCyI/QsAfQOEm3Ivu+sEa9hsWqONssHMX5WTb3DVpLjlbHE3HZo+STle875EZPIL0shPpDfwejc0YV2Xn6yElTxJPfSKHoQ/+S1KLsH7y+7IcuZAPvFYz4CVjvUablQUv4AObi+s+MnHpzXm9ZClx/SSN6GPHRhkfRIRpBRlSZfZl5IuTaEnKrB7r+/NZ29joeFX4/3qq3whaM2i4FktG7aZb+eQlKm36cLgmomnzzK7OuuQWiuf4GFWFYi+MvOLi+aUVxL+pB1/Oj0xR3WwV4N7dS8wjnc= theo.godin@protonmail.com"
        ];
      };

      environment.systemPackages = with pkgs; [
        curl
        gitMinimal
        vim
        neovim
        wget
        btop
        screen 
      ];
    };
  };

}
