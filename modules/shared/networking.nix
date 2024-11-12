{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.networking;
  inherit (config) mainUser;
  inherit (lib) mkOption types;
in {
  options = {
    custom.networking = {
      useDHCP = mkOption {
        description = "Enable DHCP usage";
        default = true;
        type = types.boolean;
      };

      hostName = mkOption {
        description = "Set device hostname";
        type = types.str;
      };
    };
  };

  config = {
    networking = {
      useDHCP = cfg.useDHCP;
      hostName = cfg.hostName;
      networkmanager = {
        enable = true;
      };
    };

    users.users.${mainUser}.extraGroups = [ "networkmanager" ];
  };
}
