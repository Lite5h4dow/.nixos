{inputs, flakePkgs, config, ...}:{
  imports = [inputs.jerry.homeManagerModules.default];

  programs.lobster ={
    enable = true;
    package = flakePkgs.lobster.default.override {
      mpv = config.programs.mpv.package;
      imagePreviewSupport = true;
      infoSupport = true;
    };

    config = {
      image_preview = "true";
    };
  };
}
