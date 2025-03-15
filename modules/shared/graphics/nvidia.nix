{ config, lib, pkgs, lib', ...}: let
  cfg = config.custom.graphics.nvidia;
  inherit (lib) mkEnableOption mkIf types;
in {
  options = {
    custom.graphics.nvidia = {
      enable = mkEnableOption {
        description = "Enable the NVidia module";
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    # TODO: remove this (temp fix for nvidia build)
    # boot.kernelPackages = pkgs.linuxPackages_6_12;

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.production;
      open = false;

      modesetting.enable = true;
      powerManagement.enable = true;
    };

    services.xserver.videoDrivers = ["nvidia"];

    # Optimizations taken from https://github.com/ventureoo/nvidia-tweaks
    services.udev.extraRules = '';
      ACTION=="bind", SUBSYSTEM=="pci", DRIVERS=="nvidia", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", TEST=="power/control", ATTR{power/control}="auto"
      ACTION=="unbind", SUBSYSTEM=="pci", DRIVERS=="nvidia", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", TEST=="power/control", ATTR{power/control}="on"
    '';

    boot.kernelParams = [
      "nvidia.NVreg_UsePageAttributeTable=1"
      "nvidia.NVreg_InitializeSystemMemoryAllocations=0"
      "nvidia.NVreg_EnableStreamMemOPs=1"
      "nvidia.NVreg_RegistryDwords=__REGISTRYDWOTDS"
    ];

    environment.variables = {
      __GL_YIELD = "USLEEP";
      __GL_MaxFramesAllowed = "1";

      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      NVD_BACKEND = "direct";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_VRR_ALLOWED = "1";
      __GL_GSYNC_ALLOWED = "1";
    };

    environment.systemPackages = [pkgs.nvtopPackages.nvidia];

    nixpkgs.config.cudaSupport = true;

    nixpkgs.overlays = [
      (
        final: prev:
          lib'.mapListToAttrs (name: {
            inherit name;
            value = lib'.wrapProgram {
              pkgs = final;
              package = prev.${name};
              wrapperArgs = ["--add-flags" "--disable-gpu-compositing"];
            };
          }) ["obsidian" "vesktop" "webcord"]
      )
    ];
  };
}
