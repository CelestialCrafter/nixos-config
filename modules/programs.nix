{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zip
    ripgrep
    jq
    fd
    busybox
  ];

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git.enable = true;
}
