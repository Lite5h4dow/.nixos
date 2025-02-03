{
  inputs, 
  pkgs,
  lib,
  ...
}:let
  inherit (lib) attrValues;
in{  
  imports = [inputs.ags.homeManagerModules.default];

  programs.ags = {
    enable = true;
    configDir = inputs.ags-config;
    extraPackages = with pkgs; [
      inputs.astal.packages.${system}.default
      gtksourceview
      webkitgtk
      accountsservice
    ]
    ++attrValues (
      removeAttrs inputs.ags.inputs.astal.packages.${pkgs.system} ["docs" "gjs" "cava"]
    );
  };
}
