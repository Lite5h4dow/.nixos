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

  environment.systemPackages = with pkgs;[
    git

    
    (python3.withPackages(python-pkgs: with python-pkgs;[
      pip
      gpiozero
      numpy
      spidev
    ]))

    libgpiod
    lgpio
    
  ];

  networking= {
    hostName = "prodpod";
    dhcpcd.enable = true;
    wireless = {
      iwd = {
        enable = true;
        settings = {
          IPv6.Enabled = false;
          # General.EnableNetworkConfiguration = true;
          Settings.AutoConnect = true;
        };
      };
      interfaces = [ "wlan0" ];
    };
  };
}
