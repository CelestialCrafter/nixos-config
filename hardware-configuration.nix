# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, inputs, ... }:

{
  imports =
    [
	(modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.gigabyte-b550
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "v4l2loopback" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "ntfs"  ];

  hardware.nvidia.modesetting.enable = true;

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/73f9a8b6-4e19-4322-a2b1-3c2e1f430388";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/D071-93B8";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ec7a6275-d11b-47fb-9fa1-162014fd44b9"; }
    ];

  fileSystems."/mnt/windows" =
    { device = "/dev/disk/by-uuid/7E605CCF605C8FAF";
      fsType = "ntfs-3g";
      options = [ "defaults" "nofail" "norecover" "ro" ];
    };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
