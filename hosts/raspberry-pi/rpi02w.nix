{pkgs, ...}:{
  # imports = [
  #   "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/raspberry-pi/3"
  # ];
   # boot.kernelPackages = pkgs.linuxPackages_rpi02w;
   boot.kernelPackages = pkgs.linuxPackages_6_6;
   hardware.deviceTree = {
     enable = true;
     filter = "*rpi-zero-2-w*.dtb";
     overlays = [
       # { name = "enable-spi";
       #   dtsText = ''
       #     /dts-v1/;
       #     /plugin/;
       #     / { compatible = "broadcom,bcm2385"; };
       #     &spi { status = "okay"; };
       #   '';
       # }
     ];
   };
}
