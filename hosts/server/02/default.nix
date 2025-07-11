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
      token = "K107a1c725b53d9004555c0b543328b06434c33c6199a21bc1ef6b10f898669a897::server:701a0bcbd15a1fa49b45ea342a3c216f"; #need to find away to pull this in
      # token = "701a0bcbd15a1fa49b45ea342a3c216f"; #need to find a way to pull this in
      role = "server";
      # clusterInit = true;
      serverAddr = "https://192.168.10.1:6443";
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
