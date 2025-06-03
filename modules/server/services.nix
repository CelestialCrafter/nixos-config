{
  config,
  pkgs,
  name,
  inputs,
  ...
}:

let
	celestialsCloset = inputs.celestials-closet.packages.${config.nixpkgs.hostPlatform.system}.default;
in {
  environment.systemPackages = [
    pkgs.seaweedfs
    celestialsCloset
  ];

  systemd.services = {
    seaweedfs = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.seaweedfs} server -dir=/var/lib/weedfs -filer -webdav";
        Restart = "on-failure";
      };
    };

    celestials-closet = {
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = celestialsCloset;
        Restart = "on-failure";
      };
    };
  };

  virtualisation.oci-containers.containers = {
    cobalt = {
      image = "ghcr.io/imputnet/cobalt:latest";
      ports = [ "9000:9000" ];
      environment.API_URL = "http://" + name;
    };
  };
}
