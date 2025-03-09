{ pkgs, inputs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim
      git
      zip
      unzip
      ripgrep
      jq
      fzf
      fd
      which
      killall
      ffmpeg
      pciutils
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.git.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
}
