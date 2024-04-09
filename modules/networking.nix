{
  networking = {
    hostName = "celestial";
    networkmanager.enable = true;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    firewall = {
      enable = true;
      allowPing = false;
      logReversePathDrops = true;
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
