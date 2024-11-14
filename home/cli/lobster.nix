{inputs, ...}:{
  imports = [inputs.lobster.packages."x86_64-linux".lobster];

  programs.lobster ={
    enable = true;
  };
}
