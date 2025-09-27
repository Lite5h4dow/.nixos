{ inputs, pkgs, lib, ... }: {
  imports = [
    inputs.hyprland.nixosModules.default
    ./gnome.nix
  ];


  # Needed for XDPH
  environment.systemPackages = with pkgs; [
    grim
    grimblast
    slurp
    hyprshot
  ];

  services.logind.settings.Login={
    handlePowerKey = "ignore";
  };
  
  programs.hyprland.enable = true;
  xdg.portal ={
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config.common = {
      "org.freedesktop.impl.portal.Screencast" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot" = "hyprland";
      "org.freedesktop.impl.portal.Screenshot.PickColor" = lib.getExe pkgs.hyprpicker;
    };
  };
}
