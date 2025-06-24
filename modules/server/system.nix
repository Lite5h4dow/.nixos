{config, inputs, pkgs, ...}: let
  inherit (config.values) mainUser;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = [
    pkgs.openiscsi
  ];

  services.openiscsi ={
    enable = true;
    name = "${config.networking.hostName}-initiatorhost";
  };
}
