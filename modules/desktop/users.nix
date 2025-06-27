{
  pkgs,
  machine,
  inputs,
  ...
}:

{
  users.users.celestial = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit machine inputs; };
    users.celestial = ./home;
  };
}
