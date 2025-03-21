{
  description = "Celestial's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
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
    {
      nixosConfigurations = nixpkgs.lib.genAttrs [ "celestial-pc" "celestial-laptop" ] (
        machine:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./modules ];
          specialArgs = { inherit machine inputs; };
        }
      );
    };
}
