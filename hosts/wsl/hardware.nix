{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "virtio_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/lib/modules/5.15.167.4-microsoft-standard-WSL2" =
    { device = "none";
      fsType = "overlay";
    };

  fileSystems."/mnt/wsl" =
    { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/mnt/wsl/docker-desktop/shared-sockets/guest-services" =
    { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/mnt/wsl/docker-desktop/shared-sockets/host-services" =
    { device = "/mnt/wsl/docker-desktop/shared-sockets/guest-services/host-services";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/mnt/wsl/docker-desktop/cli-tools" =
    { device = "/entries/docker-wsl-cli.iso/5866c8cb4263c9a9164c50da8f34cca3da02fb74219158f0adad77ddd05d277b";
      fsType = "iso9660";
      options = [ "loop" ];
    };

  fileSystems."/usr/lib/wsl/drivers" =
    { device = "drivers";
      fsType = "9p";
    };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/06eae0e0-082a-4541-b95c-d124f4aef400";
      fsType = "ext4";
    };

  fileSystems."/mnt/wslg" =
    { device = "none";
      fsType = "tmpfs";
    };

  fileSystems."/mnt/wslg/distro" =
    { device = "";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/usr/lib/wsl/lib" =
    { device = "none";
      fsType = "overlay";
    };

  fileSystems."/tmp/.X11-unix" =
    { device = "/mnt/wslg/.X11-unix";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/mnt/wslg/doc" =
    { device = "none";
      fsType = "overlay";
    };

  fileSystems."/mnt/c" =
    { device = "C:\134";
      fsType = "9p";
    };

  fileSystems."/mnt/d" =
    { device = "D:\134";
      fsType = "9p";
    };

  fileSystems."/mnt/e" =
    { device = "E:\134";
      fsType = "9p";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/2a04f521-f520-4017-aa78-594abcf3f102"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
