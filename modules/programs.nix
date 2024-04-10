{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim
      kitty

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

      pciutils
      usbutils
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };
}
