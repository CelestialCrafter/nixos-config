{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./neovim.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "celestial";
    homeDirectory = "/home/celestial";

    packages = with pkgs; [
      # river
      wideriver
      yambar
      kanshi
      fuzzel
      fnott
      grim
      slurp
      swww
      playerctl
      pamixer

      gimp
      krita
      blender
      obs-studio
      obsidian
      mpv
      qimgv
      blender

      zoxide
      tldr
      stow
      btop
      nvtopPackages.nvidia
      libnotify
      spicetify-cli
      cbonsai
      yazi
      ueberzugpp
      jujutsu
      difftastic
      mergiraf
      lua54Packages.lua
    ];

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.rose-pine-cursor;
      name = "rose-pine-cursor";
      size = 24;
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-dawn";
    };
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
      "one.ablaze.floorp"
      "dev.vencord.Vesktop"
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
