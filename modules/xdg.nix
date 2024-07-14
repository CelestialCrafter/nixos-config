{ pkgs, ... }:

{
  # XDG Portals
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      wlr = {
        enable = true;
        settings.screencast = {
          chooser_type = "dmenu";
          chooser_cmd = "${pkgs.fuzzel}/bin/fuzzel -d";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
  ];
}
