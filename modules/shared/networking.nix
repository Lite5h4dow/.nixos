{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.networking;
  inherit (config) mainUser;
  inherit (lib) types;
in {
  options = {
    custom.networking = {
      useDHCP = lib.mkOption {
        description = "Enable DHCP usage";
        default = true;
        type = types.boolean;
      };

      hostname = lib.mkOption {
        description = "Set device hostname";
        default = "${mainUser}-machine";
        types = types.string;
      };
    };
  };

  config = {
    networking = {
      useDHCP = cfg.useDHCP;
      hostname = cfg.hostname;
      networkmanager = {
        enable = true;
      };
    };

    users.users.${mainUser}.extraGroups = [ "networkmanager" ];
  };
}
