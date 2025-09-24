{pkgs, lib, config, ...}:let
  cfg = config.custom.wireshark;
  lib
in{
  home.packages = with pkgs; [
    wireshark
  ];
}
