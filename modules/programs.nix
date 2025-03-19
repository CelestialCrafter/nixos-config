{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip unzip
    ripgrep jq fzf fd
    which
    killall
    pciutils
  ];

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
}
