{pkgs, config, lib, ...}: let
  inherit (config.custom.virtualisation) qemu;
  cfg = qemu;
  inherit (lib) optional types mkIf mkOption mkEnableOption ;
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
        type = types.listOf types.str;
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
    ]++ optional cfg.quickemu.enable pkgs.quickemu;

    systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
    boot.binfmt.emulatedSystems = cfg.architectures;
  };
}
