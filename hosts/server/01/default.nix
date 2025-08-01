{lib, ...}:let
  inherit (lib) mkForce;
in{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  services ={
    k3s ={
      enable = true;
      role = "server";
      clusterInit = true;
    };
  };

  networking ={
    firewall = {
      enable = true;
      allowedTCPPorts = [
        21
        22
        80
        443
        2202
        2379
        2380
        6443
        8080
        8888
        9000
        10250
        25565
      ];
      allowedUDPPorts =[
        25565
        8472
      ];
    };
    defaultGateway= "192.168.1.1";
    nameservers = ["1.1.1.1"];
    hostName = "01-server";
    interfaces = {
      eno1.ipv4.addresses = [{
        address = "192.168.10.1";
        prefixLength = 16;
      }];
    };
  };
}
