{ pkgs, inputs, config, ... }:

let
  awesome = (pkgs.awesome.override { gtk3Support = true; }).overrideAttrs (old: {
    version = "git-master";
    src = pkgs.fetchFromGitHub {
      owner = "awesomewm";
      repo = "awesome";
      rev = "master";
      sha256 = "sha256-GIUkREl60vQ0cOalA37sCgn7Gv8j/9egfRk9emgGm/Y=";
    };

    postPatch = ''
      patchShebangs tests/examples/_postprocess.lua
      patchShebangs tests/examples/_postprocess_cleanup.lua
    '';
    patches = [];
  });
in {
  services = {
    displayManager = {
      sddm.enable = true;
	defaultSession = "none+awesome";
    };

    xserver = {
      enable = true;
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
	package = awesome;
      };
    };
  };

  environment.systemPackages = with pkgs; [ xclip xdotool ];
}
