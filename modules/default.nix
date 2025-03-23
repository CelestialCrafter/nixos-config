{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./nix-settings.nix
    ./networking.nix
    ./programs.nix
    ./audio.nix
    ./users.nix
    ./fonts.nix
    ./desktop.nix
 	./misc.nix
    ./hardware
    inputs.home-manager.nixosModules.default
  ];
}
