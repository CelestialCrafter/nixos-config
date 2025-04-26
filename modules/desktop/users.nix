{ inputs, config, ... }:

{
  home-manager = {
    extraSpecialArgs = {
      platform = config.nixpkgs.hostPlatform.system;
      inherit inputs;
    };
    useGlobalPkgs = true;
    users.celestial = import ./home;
  };
}
