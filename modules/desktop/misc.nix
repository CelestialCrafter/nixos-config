{
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  security.polkit.enable = true;
  programs.fish.enable = true;
  services.flatpak.enable = true;
}
