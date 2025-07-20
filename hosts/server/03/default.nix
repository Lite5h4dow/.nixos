{...}:{
  imports = [
    ../default.nix
    ./hardware.nix
  ];

  services = {
    k3s = {
      enable = true;
      role = "agent";
      serverAddr = "https://192.168.10.1:6443";
      tokenFile = /var/k3s-token;
    };
    klipper = {
      enable = true;
    };
    fluidd = {
      enable = true;
    };
  };

  networking = {
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
    hostName = "03-server";
    interfaces = {
      enp2s0.ipv4.addresses = [{
        address = "192.168.10.3";
        prefixLength = 16;
      }];
    };
  };
}

