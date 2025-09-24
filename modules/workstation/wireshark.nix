{osConfig, config, lib, pkgs, lib',... }:let
  username = osConfig.values.mainUser;
  cfg = config.custom.wireshark;
  inherit (lib) mkIf mkEnableOption types;
in{
  options = {
    custom.wireshark={
      enable = mkEnableOption {
        description = "Enable wireshark";
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs;[
      wireshark
    ];
    programs.wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
    users.users.${username}.extraGroups=["wireshark"];
  };
}
