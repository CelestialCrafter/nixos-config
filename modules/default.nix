{
  imports = [
    ../hardware-configuration.nix
    ./boot.nix
    ./nix-settings.nix
    ./polkit.nix
    ./rtkit.nix
    ./time-locale.nix
    ./hyprland.nix
    ./networking.nix
    ./nvidia.nix
    ./printing.nix
    ./programs.nix
    ./sound.nix
    ./users.nix
    ./xdg.nix
  ];
}