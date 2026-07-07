{ den, inputs, ... }:
{

  den.aspects.dunlocked = {
    
    nixos = { pkgs, ... }: {
      imports = [ inputs.dunlocked.nixosModules.default ];

      services.dunlocked = {
        enable = true;
        bind = "127.0.0.1:8686";
        allowedHosts = [ "dunlocked.projet137.com" ];
      };

      services.postgresql = {
        enable = true;
        ensureDatabases = [ "dunlocked" ];
        ensureUsers = [
          {
            name = "dunlocked";
            ensureDBOwnership = true;
          }
        ];

        authentication = pkgs.lib.mkOverride 10 ''
          # TYPE  DATABASE        USER            ADDRESS                 METHOD
          local   all             all                                     peer
          host    all             all             127.0.0.1/32            scram-sha-256
        '';
      };

      services.caddy = {
        enable = true;
        virtualHosts = {
          "dunlocked.projet137.com".extraConfig = ''
            tls thegod@projet137.com
            reverse_proxy localhost:8686
          '';
        };
       };
    };

  };

}
