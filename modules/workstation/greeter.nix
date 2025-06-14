{lib, pkgs, ...}:{
  services={  
    # displayManager.cosmic-greeter.enable = true;
    # greetd = {
    #   enable = true;
    #   restart = true;
    #   settings = {
    #     default_session = {
    #       # command = lib.getExe pkgs.greetd.wlgreet;
    #       command = lib.getExe pkgs.cosmic-greeter;
    #       user = "greeter";
    #     };
    #   };
    # };

    # note-to-self: use this in 25.11, they are moving gdm to its own option, not burried in xserver
    # displayManager.gdm.enable = true;
    
    xserver.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}

