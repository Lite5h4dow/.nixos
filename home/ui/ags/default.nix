{inputs, pkgs, lib, ...}:let
  inherit (lib) attrValues;
in{  
  imports = [inputs."ags-config".homeManagerModules.default];

  ags-config ={
    enable = true;
    hyprland = {
      autoStart = true;
      layerrules = true;
    };
  };

  # home.packages = with pkgs; [
  #   inputs.astal.packages.${pkgs.system}.default
  #   gjs
  # ];

  # programs.ags = {
  #   enable = true;
  #   configDir = inputs.ags-config;
  #   extraPackages = with pkgs; [
  #     gtksourceview
  #     # webkitgtk
  #     webkitgtk_6_0
  #     accountsservice
  #   ]
  #   ++attrValues (
  #     removeAttrs inputs.ags.inputs.astal.packages.${pkgs.system} ["docs" "gjs" "cava"]
  #   );
  # };
}
