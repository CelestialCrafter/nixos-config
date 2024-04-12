{ pkgs, ... }:

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

  services.gvfs.enable = true;
  services.flatpak.enable = true;
}
