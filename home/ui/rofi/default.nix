{
  pkgs,
  config,
  ...
}:{
  programs.rofi = {
    enable = true;
  };

  home.packages = with pkgs; [
    # extensions
    # rofi-emoji
    rofimoji
    rofi-bluetooth
    rofi-power-menu
    rofi-systemd
    bitwarden-menu
  ];

  # home.file = {
  #   ".config/rofi" = {
  #     source =  ./config;
  #   };
  # };
}
