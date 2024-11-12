{
  config,
  ...
}: let 
  inherit (config.values) mainUser;
in {
  environment.systemPackages = with pkgs; [
    rofi-wayland-unwrapped  

    # extensions
    rofi-emoji
    rofi-bluetooth
    rofi-power-menu
    rofi-systemd
    bitwarden-menu
  ];

  home-manager.users.${mainUser} = {
    home.files = {
      ".config/rofi" = {
        source = config.lib.file.mkOutOfStoreSymlink ./config;
      };
    };
  };
}
