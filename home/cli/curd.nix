{inputs, pkgs, ...}: {
  home.packages = [
    inputs.curd.packages.${pkgs.system}.default
  ];
}
