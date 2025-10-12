{config, inputs, ...}: let
  inherit (config.values) mainUser;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible.enable = true;
  hardware.enableRedistributableFirmware = true;
}
