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

    packages = let
      neofetch-patched = pkgs.callPackage ./neofetch {};
    in with pkgs; [
      config.programs.hyprlock.package
      hyprpicker
      neofetch-patched
      btop
      cava
      nvtopPackages.nvidia
      wofi
      inputs.waybar.packages.${pkgs.system}.waybar
      mako
      grim
      slurp
      swww
      libnotify
      playerctl
      gnome.gnome-calendar
      spicetify-cli
      neovim
      pywal
      cbonsai
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
      name = "rose-pine";
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
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      shopt -s dotglob

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
