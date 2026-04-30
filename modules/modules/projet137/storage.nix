{ den, ... }:
{
  den.aspects.p137-storage = {

    nixos = {

      fileSystems."/mnt/p137" = {
        device = "u570957@u570957.your-storagebox.de:/home/";
        fsType = "fuse.sshfs";
        options = [
          "port=23"
          "allow_other"
          "IdentityFile=/home/theo/.ssh/id_rsa"
          "user"
          "_netdev"
          "x-systemd.automount"
          "reconnect"
          "ServerAliveInterval=15"
        ];
      };

    };
  };

}
