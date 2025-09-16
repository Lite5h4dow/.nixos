{config, inputs, pkgs, ...}: let
  inherit (config.values) mainUser;
in {
  users.users.${mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    openiscsi
    mdadm
    libnfs
    nfs-utils
  ];

  services={
    openiscsi ={
      enable = true;
      name = "${config.networking.hostName}-initiatorhost";
    };

    teleport = {
      enable = true;
    };
  };

  systemd = {
    services.iscsid.serviceConfig = {
      PrivateMounts="yes";
      BindPaths = "/run/current-system/sw/bin:/bin";
    };

    tmpfiles.rules =[
      "L /usr/bin/monut - - - - /run/current-system/sw/bin/mount"
    ];
  };
}
