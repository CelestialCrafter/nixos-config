{ pkgs, ... }:

{
  # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      config = {
        common.default = "*";
        qtile.default = ["wlr" "gtk"];
      };
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-wlr ];
      wlr.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
