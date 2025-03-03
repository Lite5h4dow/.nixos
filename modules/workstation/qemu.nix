{pkgs, config, lib, ...}: let
  inherit (config.custom.virtualisation) qemu;
  cfg = qemu;
  inherit (lib) optional optionals types mkIf mkOption mkEnableOption ;
in{
  options ={
    custom.virtualisation.qemu = {
      enable = mkEnableOption {
        description = "Enable QEMU virtualisation";
        type = types.bool;
        default = false;
      };
      ui ={
        enable = mkEnableOption {
          description = "Enable QEmu ui";
          type = types.bool;
          default = false;
        };

        package = mkOption {
          description = "QEmu ui package";
          type = types.listOf types.package;
          default = with pkgs;[
            virt-manager
            virt-viewer
          ];
        };
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
    environment.systemPackages = [ pkgs.qemu ]
    ++ optional cfg.quickemu.enable pkgs.quickemu
    ++ optionals cfg.ui.enable cfg.ui.package;

    systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
    boot.binfmt.emulatedSystems = cfg.architectures;
  };
}
