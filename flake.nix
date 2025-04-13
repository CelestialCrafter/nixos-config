{
  description = "Celestial's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    tools = {
      url = "github:CelestialCrafter/tools/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixos-hardware,
      ...
    }:
    let
	  system = "x86_64-linux";
	in {
      nixosConfigurations = nixpkgs.lib.genAttrs [ "celestial-pc" "celestial-laptop" ] (
        machine:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./modules ];
          specialArgs = { inherit machine inputs system; };
        }
      );
    };
}
