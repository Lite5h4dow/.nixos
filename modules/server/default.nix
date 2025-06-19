{config, ...}:{
  imports = [
    ./values.nix
    ./system.nix
    ./kubernetes.nix
    ./home-manager.nix
  ];

  options = {
    custom.server ={
      enable = true;
    };
  };
}
