{ config, pkgs, ... }:

{
  services.fstrim = {
    enable = true;
    interval = "daily";
  };

  services.journald.extraConfig = "Storage=volatile";

  services.udisks2.enable = true;
}
