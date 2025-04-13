{pkgs, ...}:{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-ndi
      obs-tuna
      droidcam-obs
      obs-obs-websocket
      input-overlay
      advanced-scene-switcher
    ];
  };

  home.packages = with pkgs;[
    davinci-resolve
  ];
}
