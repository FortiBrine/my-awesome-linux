{ pkgs, ... }: {
  services.xserver.enable = true;
  services.libinput.enable = true;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland = {
        enable = true;
      };
    };
  };  

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    spectacle
    khelpcenter
  ];

  services.desktopManager.plasma6.enable = true;

}
