{
  pkgs,
  config,
  ...
}:{
  home.packages = with pkgs; [
    rofi-unwrapped  

    # extensions
    # rofi-emoji
    rofimoji
    rofi-bluetooth
    rofi-power-menu
    rofi-systemd
    bitwarden-menu
  ];

  home.file = {
    ".config/rofi" = {
      source =  ./config;
    };
  };
}
