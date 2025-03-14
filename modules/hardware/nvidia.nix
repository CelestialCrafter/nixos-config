{
  hardware = {
    graphics.enable = true;
    container-toolkit.enable = true;

    nvidia = {
      open = true;
      nvidiaSettings = false;
      modesetting.enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
