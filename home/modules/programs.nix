{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    compression = true;
    matchBlocks =
      let
        home = config.home.homeDirectory;
      in
      {
        "github.com" = {
          user = "git";
          identityFile = "${home}/.ssh/id_ed25519";
          identitiesOnly = true;
        };
      };
  };
  
  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
    settings = { PASSWORD_STORE_DIR = ".password-store"; };
  };

  programs.gpg = {
    enable = true;
    settings = { homedir = ".gnupg"; };
  };
}
