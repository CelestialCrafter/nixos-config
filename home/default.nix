{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.hyprlock.homeManagerModules.hyprlock
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "celestial";
    homeDirectory = "/home/celestial";

    packages = with pkgs; [
      inputs.hyprlock
      config.programs.hyprlock.package
      hyprpicker
      neofetch
      kitty
      btop
      nvtop-nvidia
      wofi
      waybar
      mako
      grim
      slurp
      swww
      libnotify
      playerctl
      pywal
      gnome.gnome-calendar
      spicetify-cli
      neovim

      noto-fonts
      noto-fonts-color-emoji
      font-awesome
    ];

    sessionVariables = {
      BROWSER = "org.mozilla.firefox";
      EDITOR = "vim";
      CURRENT_VOLUME_MAX = 1.5;
    };

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
      size = 16;
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

  xdg.userDirs = {
    enable = true;
    desktop = null;
    templates = null;
    publicShare = null;
    createDirectories = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      eval "$(zoxide init bash)"
      cat /home/celestial/.cache/wal/sequences
      alias vim='nvim'
      alias top='btop'
      alias please='sudo $(fc -ln 1)'
      
      function ps1_git_branch() {
        BRANCH=$(git branch 2> /dev/null | grep "*" | colrm 1 2)
        [[ ! -z $BRANCH ]] && echo "($BRANCH) "
      }
      PS1='\[\e[94m\]$(ps1_git_branch)\[\e[95m\]\u \W \[\e[0m\]\[\e[5 q\]'
    '';
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
    ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
