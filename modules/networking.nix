{
  networking = {
    hostName = "celestial";
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = false;
    };
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    firewall = {
      enable = true;
      allowPing = false;
      logReversePathDrops = true;
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
