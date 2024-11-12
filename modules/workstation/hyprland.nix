{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [inputs.hyprland.nixosModules.default];

  # Needed for XDPH
  environment.systemPakages = with pkgs; [
    grim
    slurp
  ];

  services.logind.extraConfig = ''
    # Disable powerbutton short press so hyprland can handle it
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
  
  programs.hyprland.enable = true;
  xdg.portal.config.common = {
    "org.freedesktop.impl.portal.Screencast" = "hyprland";
    "org.freedesktop.impl.portal.Screenshot" = "hyprland";
    "org.freedesktop.impl.portal.Screenshot.PickColor" = lib.getExe pkgs.hyprpicker;
  };
}
