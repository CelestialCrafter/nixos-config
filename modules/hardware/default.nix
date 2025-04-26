let
  pkgs = import <nixpkgs> {
    # for host‐build use: system = "x86_64-linux";
    # for aarch64 x-compile:
    crossSystem = {
      config = "aarch64-linux";
    };
  };
  lib = pkgs.lib;
in
pkgs.buildLinux rec {
  makeFlags = [ "V=1" ]; # make verbose
  binutils = pkgs.aarch64-linux-binutils;
  gcc = pkgs.aarch64-linux-gcc;
  src = pkgs.fetchFromGitHub {
    owner = "radxa";
    repo = "kernel";
    rev = "feda711dba2a9263b6dae9319c0c3a1990aeda43";
    hash = "sha256-2kXOSLpJq7O6H+aUh65IEmBm5kxYdodZlxTOshma6ZQ=";
  };

  version = "6.1.84";
  extraMeta.branch = lib.versions.majorMinor version;

  defconfig = "rockchip_linux_defconfig";

  kernelPatches = with pkgs.kernelPatches; [
    bridge_stp_helper
    request_key_helper
  ];

  ignoreConfigErrors = true;
  structuredExtraConfig = with lib.kernel; {
    MALI_KUTF = no;
    USB_G_WEBCAM = no;
    WL_ROCKCHIP = no;
    ROCKCHIP_DVBM = no;
    RK_FLASH = no;
    PCIEASPM_EXT = no;
    ROCKCHIP_IOMUX = no;
    RSI_91X = no;
    WLAN_VENDOR_BROADCOM = no;

    COMPASS_AK8975 = no;
    LS_CM3232 = no;
    GS_DMT10 = no;
    GS_KXTJ9 = no;
    GS_MC3230 = no;
    GS_MMA7660 = no;
    GS_MMA8452 = no;
    ROCKCHIP_DEBUG = no;
    RK_CONSOLE_THREAD = no;
  };
}
