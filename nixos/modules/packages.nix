{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git wget vim scrcpy
    gnome-terminal
    fastfetch cpufetch
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
    cpu-x
    zip unzip
    adwaita-icon-theme
    wireguard-tools
    yarn
    nodejs
    mongodb-compass
    btop
    tmux
    rclone

    jdk21
  ];

  networking.wireguard.enable = true;
  nixpkgs.config.allowUnfree = true;
}
