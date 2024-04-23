{ pkgs, ... }:

{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "JetBrainsMono" "FiraMono" "Meslo" ]; })
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji

      monaspace
      cozette
      roboto
      ibm-plex
      sarasa-gothic
  ];
}
