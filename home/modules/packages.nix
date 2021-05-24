{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    arduino
    atom
    bat
    bc
    etcher
    exa
#   master.ferdi
    gimp-with-plugins
    google-cloud-sdk
    hping
    htop
#   hyper
    i3lock-fancy
    inkscape
    lsd
    nettools
    nmap
    p7zip
    pinentry-gtk2
    procs
    pulsemixer
    ripgrep
    scrot
    speedtest-cli
    stow
    tree
    unrar
    unzip
    vlc
    wamnr.vscodium
    xclip
    youtube-dl
  ];
}
