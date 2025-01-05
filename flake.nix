{
  description = "My NixOS config into a flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors = {
      url = "github:misterio77/nix-colors";
    };

    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    
  in 
  {
    nixosConfigurations = {
      myNixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system pkgs; };
        modules = [./nixos/configuration.nix];
      };
    };

    homeConfigurations = {
      theo = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
      };
    };

  };
}
