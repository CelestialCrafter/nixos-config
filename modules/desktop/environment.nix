{ pkgs, inputs, ... }:

let
  river-classic = inputs.nixpkgs-stable.legacyPackages.x86_64-linux.river-classic;
in
{
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "dbus-run-session ${river-classic}/bin/river";
      user = "celestial";
    };
  };

  programs.river-classic = {
    enable = true;
    package = river-classic;
    extraPackages = with pkgs; [
      foot
      swaylock
      wideriver
      yambar
      kanshi
      fuzzel
      libnotify
      fnott
      grim
      slurp
      swww
      wl-clipboard
      lua54Packages.lua
    ];
  };

  xdg.portal.enable = true;

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "river";
    MOZ_ENABLE_WAYLAND = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };
}
