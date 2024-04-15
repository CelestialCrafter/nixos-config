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
  programs.dconf.enable = true;
  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.sushi.enable = true;
  services.gvfs.enable = true;
  services.flatpak.enable = true;
}
