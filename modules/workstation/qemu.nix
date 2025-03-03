{pkgs, config, lib, ...}: let
  inherit (config.custom.virtualisation) qemu;
  cfg = qemu;
  inherit (lib) types mkIf mkOption mkEnableOption ;
in{
  options ={
    custom.virtualisation.qemu = {
      enable = mkEnableOption {
        description = "Enable QEMU virtualisation";
        type = types.bool;
        default = false;
      };
      quickemu = {
        enable = mkEnableOption {
          description = "Enable QuickEmu";
          type = types.bool;
          default = cfg.enable;
        };
      };

      architectures = mkOption {
        description = "Architectures to emulate";
        type = types.list;
        default = [
          "aarch64-linux"
          "riscv64-linux"
        ];
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.qemu
    ]++ mkIf cfg.quickemu.enable pkgs.quickemu;

    boot.binfmt.emulatedSystems = cfg.architectures;
  };
}
