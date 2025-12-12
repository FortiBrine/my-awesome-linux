{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    gnome-terminal
    fastfetch
    gimp
    prismlauncher
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.webstorm
    kdePackages.kdenlive
    telegram-desktop
    steam
    pciutils
    discord
    postman
    termius
    obs-studio
    flameshot
    keepassxc
    dbeaver-bin
    onlyoffice-desktopeditors
    haruna
    scrcpy
    cpu-x
    cpufetch
    zip
    unzip
    adwaita-icon-theme
    bottles
  ];
  nixpkgs.config.allowUnfree = true;
}
