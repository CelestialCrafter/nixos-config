{ inputs, lib, ... }:

{
  imports = [
    ./boot.nix
    ./nix-settings.nix
    ./networking.nix
    ./programs.nix
    ./sound.nix
    ./users.nix
    ./fonts.nix
    ./desktop.nix
 	./misc.nix
    ./hardware
    inputs.home-manager.nixosModules.default
  ];
}
