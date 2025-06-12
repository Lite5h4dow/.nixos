{ lib, pkgs, ...}: {
  # services.pipewire.enable = lib.mkForce false;
  # hardware.pulseaudio.enable = true;
  

  services = {
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };

    playerctld.enable = true;
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs;[
    # pavucontrol
    # pulsemixer
    helvum
  ];
}
