{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 7;
    };
    efi.canTouchEfiVariables = true;
  };
}
