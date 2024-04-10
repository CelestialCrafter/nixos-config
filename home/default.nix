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
      swww
      libnotify
      playerctl

      noto-fonts
      noto-fonts-color-emoji
      font-awesome
    ];

    sessionVariables = {
      BROWSER = "org.mozilla.firefox";
      EDITOR = "com.visualstudio.code";
      CURRENT_VOLUME_MAX = 1.5;
    };
  };

  fonts.fontconfig.enable = true;

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
      "dev.vencord.Vesktop"
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
