{...}:{
  imports = [
    ../default.nix
    ./hardware.nix
  ];

  # services = {
  #   k3s = {
  #     enable = true;
  #     role = "agent";
  #     serverAddr = "https://192.168.10.1:6443";
  #     tokenFile = "/var/k3s-token";
  #   };
  # };

  custom = {
    server = {
      k3s = {
        role="agent";
      };
    };
  };

  networking = {
    hostName = "03-server";
    interfaces = {
      enp2s0.ipv4.addresses = [{
        address = "192.168.10.3";
        prefixLength = 16;
      }];
    };
  };
}

