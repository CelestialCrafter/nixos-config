{
  config,
  name,
  ...
}:

{
  imports = [
    (./. + "/hardware/${name}.nix")
	./boot.nix
	./nix-settings.nix
	./users.nix
	./networking.nix
	./misc.nix
    ./desktop
  ];

  # nyehehehe
  system.stateVersion = config.system.nixos.release;
}
