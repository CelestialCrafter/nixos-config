{ lib, ... }:

{
  services.openssh = {
    enable = true;
    banner = lib.concatLines [
      "      welcome back! [36m<3"
      "────────────────────────── "
    ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };
}
