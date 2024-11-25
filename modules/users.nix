{ pkgs, inputs, ... }:

{
  users.users = {
    celestial = {
      isNormalUser = true;
      description = "Celestial";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."celestial" = import ../home;
  };
}
