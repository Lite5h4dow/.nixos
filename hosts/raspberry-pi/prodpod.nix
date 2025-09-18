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

  networking= {
    dhcpcd.enable = true;
    wireless = {
      iwd = {
        enable = true;
        settings = {
          IPv6.Enabled = false;
          # General.EnableNetworkConfiguration = true;
          Settings.AutoConnect = false;
        };
      };
      interfaces = [ "wlan0" ];
    };
  };
}
