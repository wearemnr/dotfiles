{ config, pkgs, ... }:

let 
  zsh-syntax-highlighting = pkgs.fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
    sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
  };

  powerlevel10k = pkgs.fetchFromGitHub {
    owner = "romkatv";
    repo = "powerlevel10k";
    rev = "b7d90c84671183797bdec17035fc2d36b5d12292";
    sha256 = "0nzvshv3g559mqrlf4906c9iw4jw8j83dxjax275b2wi8ix0wgmj";
  };
in

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      ls = "exa --color=always -l --group-directories-first";
      ll = "exa --color=always -al --group-directories-first";
      x="xclip -selection c -i";
      c="xclip -selection c -i -f";
      v="xclip -selection c -o";
    };

    plugins = [
      { name = "zsh-syntax-highlighting"; src = zsh-syntax-highlighting; }
      { name = "powerlevel10k"; src = powerlevel10k; }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    initExtra = ''
      ${builtins.readFile ./nix-completions.sh}
    '';

    initExtraBeforeCompInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source ~/.p10k.zsh 
    '';
  };
}
