{ pkgs, ... }: {
  imports = [
    ./config.nix
    ./input.nix
    ./profiles.nix
    ./uosc.nix
    ./anime.nix
  ];

  programs.mpv ={
    enable = true;
    package = pkgs.mpv.override {
      youtubeSupport = true;
    };
  };
}
