{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "wearemnr";
    userEmail = "wearemnr@pm.me";
    signing = {
      signByDefault = true;
      key = "68647AE2";
    };
    extraConfig = {
      core.editor = "vim";
      github.username = "wearemnr";
      color.ui = true;
      pull.rebase = true;
      diff.algorithm = "patience";
    };
  };
}
