{ pkgs, ... }:

pkgs.neofetch.overrideAttrs (finalAttrs: previousAttrs: {
  patches = previousAttrs.patches ++ [
    ./special.patch
  ];
})
