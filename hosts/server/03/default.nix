{...}:{
  imports = [
    ../default.nix
    /etc/nixos/hardware-configuration.nix
  ];

  services = {
    k3s = {
      enable = true;
      role = "server";
      serverAddr = "https://192.168.10.1:6443";
      tokenFile = /var/k3s-token;
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

