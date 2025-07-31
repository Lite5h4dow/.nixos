{lib, ...}:let
  inherit (lib) mkForce;
in{
  imports = [
    ./hardware.nix
    ../default.nix
  ];

  services = {
    k3s = {
      enable = true;
      role = "server";
      serverAddr = "https://192.168.10.1:6443";
      tokenFile = /var/k3s-token;
    };
  };

  # might not be needed, need to check if nvidia-container-runtime needs to be in
  # /run/current-system/sw/bin/nvidia-container-runtime
  # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/cluster/k3s/docs/examples/NVIDIA.md
  # virtualisation.docker = {
  #   enable = true;
  #   enableNvidia = true;
  # };

  # environment.systemPackages=with pkgs;[
  #   nvidia-container-toolkit
  #   docker
  #   runc
  # ];

  networking = {
    enableIPv6 = mkForce false;
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
        8080
        8888
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
    hostName = "02-server";
    interfaces = {
      eno1.ipv4.addresses = [{
        address = "192.168.10.2";
        prefixLength = 16;
      }];
    };
  };
}
