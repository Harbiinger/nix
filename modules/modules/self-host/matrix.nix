{ den, ... }: {

  den.aspects.matrix = {

    nixos = { pkgs, ... }: {

      systemd.services = {
        matrix-conduit = {
          description = "Matrix Conduit Server";
          wantedBy = [ "multi-user.target" ];
          after = [ "network.target" ];
          serviceConfig = {
            User = "matrix";
            ExecStart = "${pkgs.matrix-conduit}/bin/conduit";
            Restart = "always";
            Environment = "CONDUIT_CONFIG=/home/matrix/.config/conduit/config.toml";
          };
          enable = true;
        };
      };
    };

    homeManager = { pkgs, ... }: {
      home = {
        sessionVariables = {
          CONDUIT_CONFIG = "/home/matrix/.config/conduit/config.toml";
        };

        packages = with pkgs; [
          matrix-conduit
        ];

        file.".config/conduit/config.toml".text = ''
          # Conduit configuration
          [global]
          port = 8008
          server_name = "cercleinfo.space"
          database_backend = "sqlite"
          database_path = "/home/matrix/db/"
          allow_check_for_updates = false
          allow_registration = true
          allow_encryption = true
          allow_federation = true
          allow_room_creation = true
          trusted_servers = ["matrix.org"]
          address = "127.0.0.1"
          [global.well_known]
          client = "https://matrix.cercleinfo.space"
          server = "matrix.cercleinfo.space:443"
        '';
      };
    };

  };

}
