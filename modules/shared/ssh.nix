{ lib, config, ... }: let
  inherit (lib) mkIf mkOption mkEnableOption values;
  inherit (config.custom) ssh;
in {
  options = {
    custom.ssh = {
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
    services = {
      sshd = {
        enable = true;
      };
      openssh = {
        enable = true;
        ports = [ 22 ];
        startWhenNeeded = true;
        openFirewall = true;
        settings = {
          PasswordAuthentication = true;
          PermitRootLogin = "prohibit-password";
        };
      };
    };
  };
}
