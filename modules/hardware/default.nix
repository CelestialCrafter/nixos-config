{ machine, ... }:

{
  imports = [ (./. + "/${machine}.nix") ];
}
