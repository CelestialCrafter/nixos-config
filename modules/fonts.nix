{ pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      (pkgs.callPackage ./azuki {})
      (pkgs.callPackage ./azuki/bold.nix {})
  ];
}
