{
  description = "Celestial's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    celestials-closet = {
      url = "github:CelestialCrafter/celestials-closet";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixosConfigurations =
        nixpkgs.lib.genAttrs
          [
            "celestial-pc-linux"
            "celestial-homelab"
            "celestial-laptop"
          ]
          (
            name:
            nixpkgs.lib.nixosSystem {
              modules = [ ./modules ];
              specialArgs = { inherit name inputs; };
            }
          );
    };
}
