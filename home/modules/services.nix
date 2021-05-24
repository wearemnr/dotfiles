{ config, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 60;
    defaultCacheTtlSsh = 60;
    maxCacheTtl = 60;
    maxCacheTtlSsh = 60;
    pinentryFlavor = "gtk2";
    sshKeys = [ "E03DB351FCA8174D7426B9F25C0F403811277B4C" ];
  };
}
