{ inputs, pkgs, lib, ... }:
{
  custom.rebuildName = "prodpod";

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

}
