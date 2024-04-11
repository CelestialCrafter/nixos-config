{
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      setLdLibraryPath = true;
    };

    nvidia = {
      nvidiaSettings = false;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  boot.initrd.kernelModules = [ "nvidia" ];
}
