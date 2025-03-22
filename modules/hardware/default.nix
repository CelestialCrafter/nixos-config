{ machine, ... }:

{
  imports = [ (./. + "/${machine}.nix") ];
  hardware.keyboard.qmk.enable = true;
}
