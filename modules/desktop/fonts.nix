{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    (callPackage ./azuki { })
    (callPackage ./azuki/bold.nix { })
  ];
}
