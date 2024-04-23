{ pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
  ];
}
