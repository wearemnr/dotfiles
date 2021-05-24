{config, pkgs, ...}:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  virtualisation.libvirtd.enable = true;

  virtualisation.virtualbox = {
    host.enable = true;
    host.headless = true;
  };

  # virtualisation.docker = {
  #   enable = true;
  #   enableOnBoot = true;
  #   storageDriver = "overlay2";
  # };

/* machinectl pull-tar --verify=no https://nspawn.org/storage/archlinux/archlinux/tar/image.tar.xz archlinux */

  # systemd.targets.machines.enable = true;
  # systemd.nspawn."archlinux" = {
  #   enable = true;
  #   execConfig = {
  #     Boot = true;
  #   };
  #   networkConfig = {
  #     Private = false;
  #   };
  # };
  # systemd.services."systemd-nspawn@archlinux" = {
  #   enable = true;
  #   wantedBy = [ "machines.target" ];
  # };
}
