{
  hardware = {
    graphics.enable = true;

    nvidia = {
      nvidiaSettings = false;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  boot.initrd.kernelModules = [ "nvidia" ];
}
