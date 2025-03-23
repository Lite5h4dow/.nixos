{pkgs, ...}:{
  # boot.kernelPackages = pkgs.linuxPackages_rpi02w;
  boot.kernelPackages = pkgs.linuxPackages_6_6;
  hardware.deviceTree = {
    enable = true;
    filter = "*rpi-zero-2-w*.dtb";
  };
}
