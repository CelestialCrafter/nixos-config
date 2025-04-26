{
  inputs,
  ...
}:

{
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users.celestial = import ./home;
  };
}
