{ osConfig, lib, ...}:let
  inherit (osConfig) fish;
in{
  programs.zoxide = {
    enable = true;
    enableFishIntegration = fish.enable;
  };
}
