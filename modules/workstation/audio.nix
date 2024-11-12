{ lib, pkgs, ...}: {
  # services.pipewire.enable = lib.mkForce false;
  hardware.pulseaudio.enable = true;

  services = {
    greetd = {
      enable = true;
      restart = true;
      settings = {
        default_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --window-padding 1 --time --time-format '%R - %F' --remember --remember-session --asterisks";
          user = "greeter";
        };
      };
    };

    pipewire = {
      enable = false;
      wireplumber.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };
    playerctld.enable = true;

    
  };

  environment.systemPackages = with pkgs;[
    pavucontrol
    pulsemixer
  ];
}
