{
  pkgs,
  lib,
  ...
}:{
  home.packages = with pkgs; [
    rofi-wayland-unwrapped  

    # extensions
    rofi-emoji
    rofi-bluetooth
    rofi-power-menu
    rofi-systemd
    bitwarden-menu
  ];

  home.files = {
    ".config/rofi" = {
      source = lib.file.mkOutOfStoreSymlink ./config;
    };
  };
}
