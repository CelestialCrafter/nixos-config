{ pkgs, ... }:

{
  users.users.celestial = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
  };
}
