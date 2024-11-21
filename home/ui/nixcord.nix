{inputs, ...}:{
  imports = [inputs.nixcord.homeManagerModules.nixcord];
  programs.nixcord = {
    enable = false;
    config = {
      frameless = true;
    };
  };
}
