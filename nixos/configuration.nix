# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/firefox.nix
      ./modules/zsh.nix
      ./modules/packages.nix
      ./modules/desktop.nix
      ./modules/nvidia.nix
    ];


  boot.blacklistedKernelModules = [ "rtw88_8821ce" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821ce
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true;
      device = "nodev";
    };
  };

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "uk_UA.UTF-8";

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  users.users.fortibrine = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11"; # Did you read the comment?

}

