{
  time.timeZone = "America/Chicago";

  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
  };

  security.rtkit.enable = true;
}
