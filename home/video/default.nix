{pkgs, lib, osConfig, ...}:let
  inherit (lib) mkIf;
  inherit (osConfig.custom) minimal;
in{
  config = mkIf (!minimal) {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-ndi
        obs-tuna
        droidcam-obs
        obs-websocket
        input-overlay
      ];
    };
    home.packages = with pkgs;[
      davinci-resolve
    ];
  };
}
