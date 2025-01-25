{inputs, pkgs, ...}: {
  environment.systemPackages = [
    inputs.curd.packages.${pkgs.system}.default
  ];
}
