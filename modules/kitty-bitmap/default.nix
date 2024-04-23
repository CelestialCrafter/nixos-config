{ pkgs, ... }:

pkgs.kitty.overrideAttrs (finalAttrs: previousAttrs: {
  patches = previousAttrs.patches ++ [
    ./allow-bitmap-fonts.patch
  ];
})
