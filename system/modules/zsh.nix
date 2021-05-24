{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls="exa --color=always -l --group-directories-first";
      ll="exa --color=always -al --group-directories-first";
      x="xclip -selection c -i";
      c="xclip -selection c -i -f";
      v="xclip -selection c -o";
    };
  };
}
