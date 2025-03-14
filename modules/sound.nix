{ pkgs, lib, machine, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
	pulse.enable = true;
  };
}
