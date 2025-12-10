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
    wine
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
  ];
  nixpkgs.config.allowUnfree = true;
}
