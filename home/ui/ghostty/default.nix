{pkgs, config, ...}:let
  inherit (config.stylix) fonts;
in {
  home={
    packages = with pkgs; [
      ghostty
    ];

    file = {
      ".config/ghostty/config" ={
        source = ./config;
      };
    };
  };
}
