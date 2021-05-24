{ config, pkgs, inputs, ... }:

{
  programs.adb.enable = true;

  programs.neovim.defaultEditor = true;

  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.npgh.defaultPackage.x86_64-linux
    acpi
    bleachbit
    brave
    cached-nix-shell
    cachix
    capitaine-cursors
    curl
    discord
    exa
    firefox
    git
    git-crypt
    glxinfo
    gparted
    gptfdisk
    htop
    keepassxc
    killall
    kora-icon-theme
    kotatogram-desktop
    lshw
    nano
    neofetch
    nixops
    parted
    pavucontrol
    pciutils
    rsync
    screen
    sweet
    sxiv
    tmux
    tree
    ueberzug
    vim
    virt-manager
    wget
    xclip
    xsel
  ] ++ (with pkgs.xorg; [
    xkill
  ]) ++ (with pkgs.gnome3; [
    gnome-disk-utility
  ]) ++ (with pkgs.xfce; [
    xfce4-battery-plugin
    xfce4-pulseaudio-plugin
    xfce4-volumed-pulse
  ]) ++ (with pkgs.gnome; [
    networkmanagerapplet
  ]);
}
