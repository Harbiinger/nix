{ den, ... }: {

  den.aspects.teamspeak = {

    nixos = { lib, ... }: {
      virtualisation = {
        containers.enable = true;
        podman = {
          enable = true;
          dockerCompat = true;
        };

        oci-containers = {
          backend = "podman";

          containers = {
            teamspeak = {
              hostname = "teamspeak";
              autoStart = true;
              image = "teamspeaksystems/teamspeak6-server:latest";
              ports = [
              "9987:9987/udp"
              "30033:30033"
              ];
              volumes = [
                "teamspeak_data:/var/tsserver/"
              ];
              environment = {
                TSSERVER_LICENSE_ACCEPTED = "accept";
              };
            };
          };
        };
      };
    };

    homeManager = {}: {};

  };

}
