{config, pkgs, ...}: {
  users.users.${config.values.mainUser} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  services = {
    geoclue2 = {
      enable = true;
    };
  };

  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;

  fonts.fontconfig.subpixel.rgba = "rgb";

  # This is already enabled by modules that require it
  # but I felt like enabling it anyway
  hardware.graphics.enable = true;
}
