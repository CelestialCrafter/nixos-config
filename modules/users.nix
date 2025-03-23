{
  pkgs,
  inputs,
  machine,
  system,
  ...
}:

{
  users.users.celestial = {
    isNormalUser = true;
    shell = pkgs.fish;
	uid = 1000;
    extraGroups = [
      "networkmanager"
      "wheel"
	  "mpd"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit machine inputs system; };
    useGlobalPkgs = true;
    users.celestial = import ./home;
  };
}
