{ config, pkgs, inputs, ... }:

{
  imports = [ ./neovim.nix ];

  home = {
    packages = with pkgs; [
      gimp
      blender
      obs-studio
      obsidian
      mpv
      qimgv
      blender

     spicetify-cli
      alsa-utils playerctl
      stow
      cbonsai
      zoxide tldr btop ffmpeg
      yazi ueberzugpp
      jujutsu difftastic mergiraf
    ];

    pointerCursor = {
      package = pkgs.rose-pine-cursor;
      name = "rose-pine-cursor";
      size = 24;
    };

    stateVersion = "24.11";
  };

  xdg = {
    mimeApps = {
	  enable = true;
	  defaultApplications."x-scheme-handler/https" = "one.ablaze.floorp.desktop";
	};

    userDirs = {
      enable = true;
      desktop = null;
      templates = null;
      publicShare = null;
      createDirectories = true;
    };
  };
}
