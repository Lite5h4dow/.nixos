{pkgs, ...}:{
  imports = [
    ./git.nix
    ./nodejs.nix
  ];

  home.packages = with pkgs; [
    go
    nixd
    android-tools
    dotnet-sdk
    fractal
    dotnetPackages.Nuget
    kubectl
    woodpecker-cli
  ];
}
