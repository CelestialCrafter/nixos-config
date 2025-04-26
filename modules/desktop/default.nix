{ inputs, ... }:

{
  imports = [
    ./audio.nix
    ./environment.nix
    ./fonts.nix
    ./programs.nix
    ./users.nix
    ./misc.nix
    inputs.home-manager.nixosModules.default
  ];
}
