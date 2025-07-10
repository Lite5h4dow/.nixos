{...}:{
  imports = [
    ../default.nix
    /etc/nixos/hardware-configuration.nix
  ];

  services = {
    k3s = {
      enable = true;
      token = "K107a1c725b53d9004555c0b543328b06434c33c6199a21bc1ef6b10f898669a897::server:701a0bcbd15a1fa49b45ea342a3c216f"; #need to find away to pull this in
      # token = "701a0bcbd15a1fa49b45ea342a3c216f"; #need to find a way to pull this in
      role = "server";
      # clusterInit = true;
      serverAddr = "https://192.168.10.1:6443";
    };
  };

  networking = {
    defaultGateway= "192.168.1.1";
    nameservers = ["1.1.1.1"];
    hostName = "02-server";
    interfaces = {
      eno1.ipv4.addresses = [{
        address = "192.168.10.3";
        prefixLength = 16;
      }];
    };
  };
}

