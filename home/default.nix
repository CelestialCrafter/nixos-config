{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home.username = "celestial";
  home.homeDirectory = "/home/celestial";

  home.packages = with pkgs; [
    neofetch
    kitty
    btop
  ];

  programs.hyprlock.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''eval "$(zoxide init bash)"'';
  };

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
