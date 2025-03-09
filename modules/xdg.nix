{ pkgs, ... }:

{
  xdg = {
    autostart.enable = true;
    portal = {
      config.common.default = "*";
      enable = true;
      wlr.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [ xdg-utils ];
}
