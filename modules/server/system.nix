{config, inputs, pkgs, ...}: let
  inherit (config.values) mainUser;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = [
    pkgs.openiscsi
    pkgs.mdadm
  ];

  services.openiscsi ={
    enable = true;
    name = "${config.networking.hostName}-initiatorhost";
  };

  systemd.services.iscsid.serviceConfig = {
    PrivateMounts="yes";
    BindPaths = "/run/current-system/sw/bin:/bin";
  };
}
