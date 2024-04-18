{ pkgs, inputs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim
      kitty
      gnome.nautilus
      polkit_gnome

      wget
      aria2
      git
      gh
      zip
      unzip
      ripgrep
      jq
      fzf
      zoxide
      tldr
      fd
      bat
      which
      killall
      ffmpeg
      python3

      pciutils
      usbutils
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    dconf.enable = true;
    git = {
      enable = true;
      config = {
        diff = {
          tool = "kitty";
          guitool = "kitty.gui";
        };
        difftool = {
          prompt = false;
          trustExitCode = true;
          kitty.cmd = "kitten diff $LOCAL $REMOTE";
          kitty.gui.cmd = "kitten diff $LOCAL $REMOTE";
        };
      };
    };
  };

  services = {
    gnome = {
      evolution-data-server.enable = true;
      gnome-online-accounts.enable = true;
      gnome-keyring.enable = true;
      sushi.enable = true;
    };

    gvfs.enable = true;
    flatpak.enable = true;
  };
}
