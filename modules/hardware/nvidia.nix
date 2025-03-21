{
  hardware = {
    graphics.enable = true;
    nvidia-container-toolkit.enable = true;

    nvidia = {
      open = true;
      nvidiaSettings = false;
      modesetting.enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
