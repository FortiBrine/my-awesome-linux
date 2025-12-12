{ config, lib, pkgs, ... }:

{
  boot.blacklistedKernelModules = [
    "rtw88_8821ce"
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821ce
  ];
}

