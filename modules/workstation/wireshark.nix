{ config, lib, pkgs, lib',... }:let
  cfg = config.custom.wireshark;
  inherit (lib) mkIf mkEnableOption types;
in{
  options = {
    custom.wireshark = mkEnableOption {
      description = "Enable wireshark";
      type = types.bool;
      default = true;
    };
  };
  config = mkIf cfg.enable {
    programs.wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enabl = true;
    };
  };
}
