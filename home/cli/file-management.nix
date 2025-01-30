{pkgs, ...}:{
  home.packages = with pkgs; [
    zip
    rar
  ];
}
