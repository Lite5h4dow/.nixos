{...}:{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  custom = {
    server={
      k8s = {
        isMaster = true;
      };
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
        6443
        25565
      ];
      allowedUDPPorts =[
        25565
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
