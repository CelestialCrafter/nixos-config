{
  time.timeZone = "America/Chicago";

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
}
