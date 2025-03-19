{ pkgs, inputs, machine, ... }:

{
  users.users.celestial = {
    isNormalUser = true;
      shell = pkgs.fish;
      extraGroups = [ "networkmanager" "wheel" "keyd" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit machine inputs; };
    useGlobalPkgs = true;
    users.celestial = import ./home;
  };
}
