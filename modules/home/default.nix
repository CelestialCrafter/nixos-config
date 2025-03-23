{
  pkgs,
  inputs,
  system,
  ...
}:

{
  imports = [
    ./neovim.nix
    ./jj.nix
  ];

  home = {
    packages = with pkgs; [
      gimp
      blender
      obs-studio
      mpv
      qimgv
      blender
	  deluge
      floorp
      (vesktop.override {
        withSystemVencord = true;
      })

      spicetify-cli
      alsa-utils
      playerctl
      stow
      cbonsai
      zoxide
      tldr
      btop
      ffmpeg

      yazi
      ueberzugpp

      rmpc
      mpd-mpris
	  picard
	  puddletag
      inputs.lyricizer.packages.${system}.default
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
