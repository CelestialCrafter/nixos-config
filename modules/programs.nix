{ pkgs, inputs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      polkit_gnome
      foot

      wget
      vim
      aria2
      git
      git-lfs
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
      stow

      pciutils
      usbutils
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    dconf.enable = true;
    git.enable = true;
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
