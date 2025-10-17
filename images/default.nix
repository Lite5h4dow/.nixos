{lib', inputs}: let
  inherit (inputs) nixpkgs;
  inherit (lib') mkNixosSystem;
  inherit (nixpkgs.lib) optional;

  modulePath = ../modules;
  hostPath = ../hosts;

  shared = modulePath + /shared;
  workstation = modulePath + /workstation;
  server = modulePath + /server;
  raspberry-pi-module = modulePath + /raspberry-pi;
  raspberry-pi-host = hostPath + /raspberry-pi;
  radxa-module = modulePath + /radxa;
  radxa-host = hostPath + /radxa;

  pi-modules = os: [
    "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    raspberry-pi-module
    raspberry-pi-host
    shared
  ]
  ++ optional (os == "rpi0") (raspberry-pi-host + /rpi0.nix)
  ++ optional (os == "rpi02w") (raspberry-pi-host + /rpi02w.nix)
  ++ optional (os == "rpi3") (raspberry-pi-host + /rpi3.nix)
  ;

  radxa-modules = os: [
    "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
    radxa-module
    radxa-host
    shared
  ]
  ++ optional (os == "prodpod") (radxa-host + /prodpod.nix)
  ;


  "rpi02w" = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules "rpi02w";
  };

  "rpi0" = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules "rpi0";
  };

  "rpi3" = mkNixosSystem {
    system = "aarch64-linux";
    modules = pi-modules "rpi3";
  };

  "prodpod" = mkNixosSystem {
    system = "aarch64-linux";
    modules = radxa-modules "prodpod";
  };

in {
  rpi02w = rpi02w.config.system.build.sdImage;
  rpi0 = rpi0.config.system.build.sdImage;
  rpi3 = rpi3.config.system.build.sdImage;
  prodpod = prodpod.config.system.build.sdImage;
  cm3j-uboot = nixpkgs.legacyPackages.aarch64-linux.buildUBoot {
    src = inputs.custom-uboot;
    version = "2025.10";
    defconfig = "radxa-cm3j-rpi-cm4-io-rk3568_defconfig";
    extraMeta.platforms = [ "aarch64-linux" ];
    filesToInstall = [
      "idbloader.img"
      "u-boot.itb"
      "u-boot-rockchip.bin"
    ];
  };
}
