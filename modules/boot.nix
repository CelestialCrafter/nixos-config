{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 6;
    };
    efi.canTouchEfiVariables = true;
  };
}
