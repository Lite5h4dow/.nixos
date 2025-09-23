{pkgs, lib, config, ...}:{
  boot={
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "hci_uart" ];
    kernelParams = lib.mkForce [
      "console=ttyAMA0,115200n8"
      "console=tty0"
      "nohibernate"
      "loglevel=7"
      "lsm=landlock,yama,bpf"
    ];
  };

  hardware.deviceTree = {
    enable = true;
    # overlays = [
    # {
      # name = "prodpod-device";
      # dtsFile = ./prodpod.dts;
    # }
    # ]
    # ;
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

  hardware = {
    bluetooth = {
      powerOnBoot = true;
      enable = true;
    };
  };

  services = {
    blueman = {
      enable = true;
    };
  };

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
