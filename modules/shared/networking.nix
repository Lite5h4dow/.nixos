{ config, lib, pkgs, lib', ... }: let
  cfg = config.custom.networking;
  inherit (config.values) mainUser;
  inherit (lib) mkIf mkForce mkEnableOption mkOption types;
in {
  options = {
    custom.networking = {
      enable = mkEnableOption {
        description = "Enable default networking module";
        type = types.bool;
        default = true;
      };

      useDHCP = mkOption {
        description = "Enable DHCP usage";
        default = false;
        type = types.bool;
      };

      hostName = mkOption {
        description = "Set device hostname";
        default = "${mainUser}-machine";
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    networking = {
      useDHCP = mkForce cfg.useDHCP;
      hostName = cfg.hostName;
      networkmanager = {
        enable = true;
      };
    };

    # TODO: remove this (temp fix for nvidia build)
    boot.kernelPackages = pkgs.linuxPackages_6_12;

    users.users.${mainUser}.extraGroups = [ "networkmanager" ];
  };
}
