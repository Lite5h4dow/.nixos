{...}:{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  services ={
    k3s ={
      enable = true;
      token = "701a0bcbd15a1fa49b45ea342a3c216f"; #need to find a way to pull this in
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
        6443
        8888
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
