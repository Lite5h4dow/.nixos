{ osConfig, lib, ...}:let
  inherit (osConfig.custom) fish;
in{
  programs.zoxide = {
    enable = true;
    enableFishIntegration = fish.enable;
  };
}
