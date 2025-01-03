{inputs, ...}:{
  environment.systemPackages = [
    inputs.lobster.packages.x86_64-linux.lobster
  ];
}
