{ machine, ... }:

{
  networking = {
    hostName = machine;
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    networkmanager.enable = true;
    firewall.enable = true;
  };

  systemd.network.wait-online.enable = false;
}
