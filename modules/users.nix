{ pkgs, ... }:

{
  users.users.celestial = {
    isNormalUser = true;
    shell = pkgs.fish;
    uid = 1000;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
