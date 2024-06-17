{ pkgs, ... }:

{
  # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
