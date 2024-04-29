{ pkgs, ... }:

pkgs.pywal.overrideAttrs (finalAttrs: previousAttrs: {
  propagatedBuildInputs = [
    pkgs.callPackage ../color-thief {}
  ];
})
