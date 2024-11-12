{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "celestial";
    homeDirectory = "/home/celestial";

    packages = let
      nixvim-config = inputs.nixvim-config.packages.${pkgs.system}.default;
    in with pkgs; [
      btop
      nvtopPackages.nvidia
      grim
      slurp
      libnotify
      playerctl
      pamixer
      spicetify-cli
      cbonsai
      qimgv
      nixvim-config
    ];

    sessionVariables = {
      BROWSER = "one.ablaze.floorp";
      EDITOR = "nvim";
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  xdg.userDirs = {
    enable = true;
    desktop = null;
    templates = null;
    publicShare = null;
    createDirectories = true;
  };

  programs.bash = {
    enableCompletion = true;
  };

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "com.spotify.Client"
      "dev.vencord.Vesktop"
      "org.videolan.VLC"
      "org.gimp.GIMP"
      "org.kde.krita"
      "org.blender.Blender"
      "com.obsproject.Studio"
      "com.visualstudio.code"
      "org.gnome.FileRoller"
      "org.gnome.baobab"
      "com.system76.Popsicle"
      "org.pulseaudio.pavucontrol"
      "md.obsidian.Obsidian"
      "one.ablaze.floorp"
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
