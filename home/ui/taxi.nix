{pkgs, ...}:{
  home.packages = with pkgs;[
    taxi
    filezilla
  ];
}
