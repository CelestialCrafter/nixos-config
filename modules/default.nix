{ config, machine, ... }:

{
  imports = [
    (./hardware + "/${machine}.nix")
    ./desktop
    ./networking.nix
    ./nix-settings.nix
    ./misc.nix
    ./programs.nix
  ];

  networking.hostName = machine;
  system.stateVersion = config.system.nixos.release;
}
