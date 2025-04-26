{ config, name, ... }:

{
  imports = [
    (./hardware + "/${name}.nix")
    (
      {
        "celestial-pc-linux" = ./desktop;
        "celestial-laptop" = ./desktop;
      }
      .${name}
    )
    ./boot.nix
	./users.nix
    ./networking.nix
    ./nix-settings.nix
    ./misc.nix
  ];

  networking.hostName = name;

  # :3
  system.stateVersion = config.system.nixos.release;
}
