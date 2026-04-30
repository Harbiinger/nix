{ inputs, den, ... }:
{
  den.aspects.thinkpad.includes = [ (den.provides.tty-autologin "theo") ];

  perSystem = { pkgs, ... }: {
    packages.vm = pkgs.writeShellApplication {
      name = "vm";
      text = let
        host = inputs.self.nixosConfigurations.thinkpad.config;
      in ''
        ${host.system.build.vm}/bin/run-${host.networking.hostName}-vm "$@"
      '';
    };
  };
}
