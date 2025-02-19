{pkgs, inputs, ...}:{
  home.packages = with pkgs; [
    inputs.blender-pkgs.legacyPackages.${system}.blender-hip
  ];
}
