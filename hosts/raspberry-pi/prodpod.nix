{pkgs, ...}:{
  boot.kernelPackages = pkgs.linuxPackages_latest;
   hardware.deviceTree = {
     enable = true;
     overlays = [
      {
        name = "prodpod-device";
        dtsFile = ./prodpod.dts;
      }
    ]
    ;
   };
}
