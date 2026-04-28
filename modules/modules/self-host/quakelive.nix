{ den, ... }: {
  
  den.aspects.quakelive = {

    includes = with den.aspects; [
      nvchad
    ];
    
    nixos = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      services.redis.servers = {
        "quakelive" = {
          enable = true;
          port = 6379;
        };
      };

      systemd.services."qlds" = {
        enable = true;
        description = "Quake Live Dedicated Server";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        path = [
          pkgs.python312
          pkgs.steam-run
        ];
        serviceConfig = {
          User = "quakelive";
          Environment = ''
          PYTHONPATH=${pkgs.python312Packages.redis}/lib/python3.12/site-packages:${pkgs.python312Packages.hiredis}/lib/python3.12/site-packages:${pkgs.python312Packages.pyzmq}/lib/python3.12/site-packages:${pkgs.python312Packages.urllib3}/lib/python3.12/site-packages:${pkgs.python312Packages.requests}/lib/python3.12/site-packages:${pkgs.python312Packages.idna}/lib/python3.12/site-packages:${pkgs.python312Packages.certifi}/lib/python3.12/site-packages:${pkgs.python312Packages.charset-normalizer}/lib/python3.12/site-packages
          PATH=${pkgs.python312}/bin:${pkgs.steam-run}/bin:$PATH
          '';
          ExecStart = "${pkgs.steam-run}/bin/steam-run /home/quakelive/.quakelive/start.sh";
          Restart = "always";
        };
      };

      users.users.quakelive = {
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeu4sMFkBPNDVgZES48SFQeYzq3LnqlnZOLP62XbWlUuFFT5yHlA/eLRe43v0eKxsApzOnlXBEWORCoWq3958MUaP9HIvaI21P5zjPQPkYco65WbdXJ1wkX+05EEvBnzHdERRY0K76gxjlPgf7OVbZIntdE1atZURwCoBarXjVZU1ux/RVelBcR/KawQZUkN12IrD78l+/C86AjHwlGVk1RR1eEkW1D8S9zCyI/QsAfQOEm3Ivu+sEa9hsWqONssHMX5WTb3DVpLjlbHE3HZo+STle875EZPIL0shPpDfwejc0YV2Xn6yElTxJPfSKHoQ/+S1KLsH7y+7IcuZAPvFYz4CVjvUablQUv4AObi+s+MnHpzXm9ZClx/SSN6GPHRhkfRIRpBRlSZfZl5IuTaEnKrB7r+/NZ29joeFX4/3qq3whaM2i4FktG7aZb+eQlKm36cLgmomnzzK7OuuQWiuf4GFWFYi+MvOLi+aUVxL+pB1/Oj0xR3WwV4N7dS8wjnc= theo.godin@protonmail.com"
        ];
      };
    };

    homeManager = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;
      home = {
        sessionVariables = {
          TERM = "kitty";
          EDITOR = "nvim";
        };

        packages = with pkgs; [
          steamcmd
          steam-run
          redis
          python312
        ];
      };
    };

  };

}
