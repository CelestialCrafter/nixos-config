{ config, name, ... }:

{
  imports = [
    (./hardware + "/${name}.nix")
	./desktop
    ./networking.nix
    ./nix-settings.nix
    ./misc.nix
    ./programs.nix
  ];

  networking.hostName = name;
  system.stateVersion = config.system.nixos.release;
}
