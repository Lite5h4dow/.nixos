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
    networkmanager = {
      enable = true;
    };
    wireless = {
      enable = true;
      iwd = {
        enable = true;
        settings = {
          IPv6.Enabled = false;
          General.EnableNetworkConfiguration = true;
          Settings.AutoConnect = false;
        };
      };
      interfaces = [ "wlan0" ];
    };
  };
}
