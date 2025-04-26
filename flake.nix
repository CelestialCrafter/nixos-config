{
  description = "Celestial's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    tools = {
      url = "github:CelestialCrafter/tools";
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
