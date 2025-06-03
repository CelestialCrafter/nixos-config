{
  networking = {
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    firewall.enable = true;
    nftables.enable = true;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
