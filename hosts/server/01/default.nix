{...}:{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  # services ={
  #   k3s ={
  #     enable = true;
  #     role = "server";
  #     clusterInit = true;
  #   };
  # };

  custom = {
    server = {
      k3s = {
        masterNode=true;
      };
    };
  };

  networking ={
    hostName = "01-server";
    interfaces = {
      eno1.ipv4.addresses = [{
        address = "192.168.10.1";
        prefixLength = 16;
      }];
    };
  };
}
