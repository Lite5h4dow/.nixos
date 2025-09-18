{...}:{
  imports = [
    ../default.nix
    # ./hardware.nix
  ];

  custom = {
    server = {
      k3s = {
        role="agent";
      };
    };
  };

  networking = {
    hostName = "04-server";
    interfaces = {
      enp2s0.ipv4.addresses = [{
        address = "192.168.10.4";
        prefixLength = 16;
      }];
    };
  };
}
