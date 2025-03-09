{ pkgs, inputs, ... }:

{
  users.users = {
    celestial = {
      isNormalUser = true;
      description = "Celestial";
      shell = pkgs.fish;
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."celestial" = import ../home;
  };
}
