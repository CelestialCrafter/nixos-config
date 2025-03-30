{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:

{
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "dbus-run-session ${pkgs.river}/bin/river";
      user = "celestial";
    };
  };

  programs.river = {
    enable = true;
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
  };
}
