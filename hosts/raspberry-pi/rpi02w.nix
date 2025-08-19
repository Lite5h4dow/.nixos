{pkgs, ...}:{
  # imports = [
  #   "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/3"
  # ];
   boot.kernelPackages = pkgs.linuxPackages_rpi02w;
   # boot.kernelPackages = pkgs.linuxPackages_6_6;
   hardware.deviceTree = {
     enable = true;
     filter = "*-rpi-3*.dtb";
     overlays = [
       {
         name = "spi0-1cs";
         dtboFile= "${pkgs.device-tree_rpi.overlays}/spi0-1cs.dtbo";
       }
       {
         name = "i2c";
         dtboFile= "${pkgs.device-tree_rpi.overlays}/i2c-bcm2708.dtbo";
       }
     ]
     ;
   };
}
