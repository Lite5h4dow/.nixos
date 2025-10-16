{ inputs, pkgs, lib, ... }:
let
  cm3j-uboot = pkgs.buildUBoot {
    src = fetchGit {
      url = "https://git.litelot.us/litelotus/u-boot.git";
      hash = lib.fakeHash;
    };
    defconfig = "radxa-cm3j-rpi-cm4-io-rk3568_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    filesToInstall = [
      "idbloader.img"
      "u-boot.itb"
      "u-boot-rockchip.bin"
    ];
  };

in
{
  custom.rebuildName = "prodpod";

  boot = {
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

}
