{
  pkgs,
  config,
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
      source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
}
