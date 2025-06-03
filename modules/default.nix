{ config, name, ... }:

{
  imports = [
    (./hardware + "/${name}.nix")
    (
      {
        "celestial-pc-linux" = ./desktop;
        "celestial-homelab" = ./server;
        "celestial-laptop" = ./desktop;
      }
      .${name}
    )
    ./networking.nix
    ./nix-settings.nix
    ./misc.nix
    ./programs.nix
  ];

  networking.hostName = name;
  system.stateVersion = config.system.nixos.release;
}
