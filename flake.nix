{
  description = "Celestial's NixOS Configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      celestial = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
