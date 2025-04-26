{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    networkmanager.enable = true;
    firewall.enable = true;
    nftables.enable = true;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
