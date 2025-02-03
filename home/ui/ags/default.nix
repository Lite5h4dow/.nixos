{
  inputs, 
  pkgs,
  lib,
  ...
}:let
  inherit (lib) attrValues;
in{  
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = [
    inputs.astal.packages.${pkgs.system}.default
  ];

  programs.ags = {
    enable = true;
    configDir = inputs.ags-config;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ]
    ++attrValues (
      removeAttrs inputs.ags.inputs.astal.packages.${pkgs.system} ["docs" "gjs" "cava"]
    );
  };
}
