{config, ...}:{
  imports = [
    ./values.nix
    ./system.nix
    # ./k3s.nix
    # ./kubernetes.nix
    ./home-manager.nix
  ];

  options = {
    custom.server ={
      enable = true;
    };
  };
}
