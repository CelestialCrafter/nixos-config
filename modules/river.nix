{ pkgs, inputs, config, ... }:

{
  programs.river.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "dbus-run-session ${pkgs.river}/bin/river";
        user = "celestial";
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      foot
      wl-clipboard
    ];

    # magic variables that I totally understand
    # sorted (kinda) by least arcane to most arcane
    sessionVariables = {
      XDG_CURRENT_DESKTOP="river";
      MOZ_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GBM_BACKEND = "nvidia-drm";
      GTK_USE_PORTAL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };
}
