{
  description = "My NixOS config into a flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.11";
  };

  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux"

    pkgs = import nixpkgs {
      inherit system;

      config = { 
        allowUnfree = true;
      };
    };

  in 
  {
    nixosConfiguration = {
      myNixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };

        modules = [./nixos/configuration.nix];
      };
    };

  };
}
