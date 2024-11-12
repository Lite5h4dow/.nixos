{ lib, pkgs, ...}: {
  services.pipewire.enable = lib.mkForce false;
  hardware.pulseaudio.enable = true;

  environment.systemPackages = with pkgs;[
    pavucontrol
    pulsemixer
  ];
}
