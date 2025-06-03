{ inputs, ... }:

{
  imports = [
    ./audio.nix
    ./environment.nix
    ./fonts.nix
    ./users.nix
    ./misc.nix
	./boot.nix
    inputs.home-manager.nixosModules.default
  ];
}
