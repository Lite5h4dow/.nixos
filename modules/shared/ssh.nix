{ lib, config, ... }: let
  inherit (lib) mkIf mkOption mkEnableOption values;
  inherit (config.custom) ssh;
in {
  options = {
    options.custom.ssh = {
      enable = mkEnableOption {
        description = "Enable SSH";
        type = values.bool;
        default = true;
      };

      allowRoot = mkOption {
        description = "allow root login";
        type = values.bool;
        default = false;
      };
    };
  };

  config = mkIf ssh.enable {
    services.openssh = {
      enable = true;
      startWhenNeeded = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
  };
}
