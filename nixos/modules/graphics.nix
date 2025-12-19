{ config, lib, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    powerManagement = {
      enable = true;
      finegrained = true;
    };
  };

  hardware.nvidia.prime = {
    offload.enable = true;

    intelBusId  = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}

