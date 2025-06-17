{...}:{
  imports = [
    ./hardware.nix
  ];

  custom = {
    networking.hostname = "node-01";
  };
}
