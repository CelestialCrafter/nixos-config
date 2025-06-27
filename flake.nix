{
  description = "cels nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
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
            machine:
            nixpkgs.lib.nixosSystem {
              modules = [ ./modules ];
              specialArgs = { inherit machine inputs; };
            }
          );
    };
}
