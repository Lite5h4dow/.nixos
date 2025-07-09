{...}:{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  services ={
    k3s ={
      enable = true;
      # token = "701a0bcbd15a1fa49b45ea342a3c216f"; #need to find a way to pull this in
      token = "K107a1c725b53d9004555c0b543328b06434c33c6199a21bc1ef6b10f898669a897::server:701a0bcbd15a1fa49b45ea342a3c216f"; #need to find away to pull this in
      role = "server";
      clusterInit = true;
    };
    openiscsi={
      enable=true;
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
        8888
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
