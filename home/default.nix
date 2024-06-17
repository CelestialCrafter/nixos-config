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
      neofetch-patched = pkgs.callPackage ./neofetch {};
      wideriver = pkgs.callPackage ./wideriver {};
      ristate = pkgs.callPackage ./ristate {};
    in with pkgs; [
      neofetch-patched
      btop
      cava
      nvtopPackages.nvidia
      fuzzel
      yambar
      fnott
      grim
      slurp
      swww
      libnotify
      playerctl
      pamixer
      spicetify-cli
      neovim
      cbonsai
      wideriver
      ristate
      imagemagick
      qimgv
    ];

    sessionVariables = {
      BROWSER = "one.ablaze.floorp";
      EDITOR = "nvim";
      CURRENT_VOLUME_MAX = 1.7;
      FLATPAK_ENABLE_SDK_EXT="golang";
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.callPackage ./rose-pine-cursor {};
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
      package = pkgs.gnome.gnome-themes-extra;
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
      "io.github.flattool.Warehouse"
      "com.github.tchx84.Flatseal"
      "org.gnome.FileRoller"
      "io.github.celluloid_player.Celluloid"
      "org.gnome.baobab"
      "com.system76.Popsicle"
      "org.pulseaudio.pavucontrol"
      "md.obsidian.Obsidian"
      "org.gnome.clocks"
      "com.github.johnfactotum.Foliate"
      "one.ablaze.floorp"
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
