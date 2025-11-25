{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    ./helix.nix
    ./jujutsu.nix
  ];

  home = {
    packages = with pkgs; [
      gimp3
      obs-studio
      mpv
      qimgv
      deluge
      firefox
      vesktop

      spicetify-cli
      alsa-utils
      playerctl
      stow
      cbonsai
      zoxide
      tldr
      btop
      ffmpeg
      babelfish
      nix-your-shell

      yazi
      ueberzugpp

      rmpc
      picard
      puddletag
    ];

    pointerCursor = {
      package = pkgs.rose-pine-cursor;
      name = "rose-pine-cursor";
      size = 24;
    };

    stateVersion = config.home.version.release;
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/https" = "firefox";
        "x-scheme-handler/http" = "firefox";
      };
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
