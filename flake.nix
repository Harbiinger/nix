{
  description = "My NixOS config into a flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/d20ee312108d0e7879011cfffa3a83d06e48d29e";
      # url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprspace = {
    #   url = "github:KZDKM/Hyprspace";
    #   inputs.hyprland.follows = "hyprland";
    # };

    nix-colors = {
      url = "github:misterio77/nix-colors";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, hyprlock, hyprland-plugins, ... }@inputs: 
  # outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, hyprlock, hyprland-plugins, Hyprspace, ... }@inputs: 
  let 
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

  in 
  {
    nixosConfigurations = {
      myNixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs system pkgs pkgs-unstable; };
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
