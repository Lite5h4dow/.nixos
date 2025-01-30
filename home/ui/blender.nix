{pkgs, ...}:{
  home.packages = with pkgs; [
    python3Packages.openusd.override {withOsl = false;}
    blender
  ];
}
