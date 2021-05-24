{ config, lib, ... }:

{
  security.protectKernelImage = true;

  boot.tmpOnTmpfs = lib.mkDefault true;

  boot.cleanTmpDir = lib.mkDefault (!config.boot.tmpOnTmpfs);

  boot.loader.systemd-boot.editor = false;

  boot.kernel.sysctl = {
    "kernel.sysrq" = 0;
  };
}
