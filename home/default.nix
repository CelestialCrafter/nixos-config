{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  home = {
    username = "celestial";
    homeDirectory = "/home/celestial";

    packages = with pkgs; [
      inputs.hyprlock
      neofetch
      kitty
      btop
      wofi
      waybar
      mako
      wlogout
      grim
      slurp
    ];

    file = let
      dotfiles = builtins.fetchGit "/home/celestial/dotfiles";
      configPath = ".config";
    in {
      "${configPath}/neofetch/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/neofetch";
        recursive = true;
      };

      "${configPath}/btop/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/btop";
        recursive = true;
      };

      "${configPath}/hypr/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hypr";
        recursive = true;
      };

      "${configPath}/kitty/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/kitty";
        recursive = true;
      };

      "${configPath}/mako/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/mako";
        recursive = true;
      };

      "${configPath}/waybar/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/waybar";
        recursive = true;
      };

      "${configPath}/wofi/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wofi";
        recursive = true;
      };

      "${configPath}/wlogout/" = {
        source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wlogout";
        recursive = true;
      };
    };

    sessionVariables = {
      BROWSER = "org.mozilla.firefox";
      EDITOR = "com.visualstudio.code";
    };
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };
  };

  programs.hyprlock.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''eval "$(zoxide init bash)"'';
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
      "org.mozilla.firefox"
      "com.discordapp.Discord"
      "com.spotify.Client"
      "org.videolan.VLC"
      "org.gimp.GIMP"
      "org.kde.krita"
      "org.blender.Blender"
      "com.obsproject.Studio"
      "com.visualstudio.code"
      "io.github.flattool.Warehouse"
      "com.github.tchx84.Flatseal"
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
