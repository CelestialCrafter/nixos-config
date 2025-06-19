{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "xhci_pci"
    "nvme"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/62d433b7-5f70-420b-86b8-62bb98194df4";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  boot.initrd.luks.devices."luks-bac23852-d3b3-4857-966c-c5976d8abdd7".device =
    "/dev/disk/by-uuid/bac23852-d3b3-4857-966c-c5976d8abdd7";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3E72-9440";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/055d8db3-2f56-43f4-a6c1-44675a9a610c"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
