{ pkgs, ... }:

{
  security.polkit.enable = true;
  environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
