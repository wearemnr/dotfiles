{ config, pkgs, ... }:

{
  imports = [
    ./modules/alacritty.nix
    ./modules/git.nix
    ./modules/gtk.nix
    ./modules/neovim.nix
    ./modules/packages.nix
    ./modules/programs.nix
    ./modules/services.nix
    ./modules/zsh.nix
  ];

  programs.home-manager.enable = true;

  home.username = "mbpnix";
  home.homeDirectory = "/home/mbpnix";

  home.stateVersion = "21.05";

  xdg.enable = true;

  manual = {
    html.enable = false;
    manpages.enable = false;
    json.enable = false;
  };

  /* Fix this! */
  # home.sessionVariable = {
  #   EDITOR = "vim";
  # };
}
