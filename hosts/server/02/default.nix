{...}:{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  networking ={
    firewall = {
      enable = true;
      allowedTCPPorts = [
        21
        22
        80
        443
        25565
      ];
      allowedUDPPorts =[
        25565
      ];
    };

    defaultGateway= "192.168.1.1";
    nameservers = ["1.1.1.1"];
    hostName = "02-server";
    # interfaces = {
    #   eno1.ipv4.addresses = [{
    #     address = "192.168.10.2";
    #     prefixLength = 16;
    #   }];
    # };
  };
}
