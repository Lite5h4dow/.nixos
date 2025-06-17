{
  config,
  lib,
  pkgs,
  lib',
  ...
}: let
  cfg = config.custom.gaming.xr;
  username = config.values.mainUser;
in {
  options = {
    custom.gaming.xr = {
      enable = lib.mkEnableOption {
        description = "Enable XR module";
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      # depending on wether steam works this may not be needed 👀
      monado = {
        enable = true;
        defaultRuntime = true;
        # environment = {
        #   STEAMVR_LH_ENABLE = "1";
        #   XRT_COMPOSITOR_COMPUTE = "1";
        #   WMR_HANDTRACKING = "0";
        # };
      };
    };
    home-manager.users.${username}.xdg ={
      configFile= {
        "openvr/openvrpaths.vrpath".text = ''
          {
            "config" :
            [
              "/home/lotus/.local/share/Steam/config"
            ],
            "external_drivers" : null,
            "jsonid" : "vrpathreg",
            "log" :
            [
              "/home/lotus/.local/share/Steam/logs"
            ],
            "runtime" :
            [
              "${pkgs.opencomposite}/lib/opencomposite"
            ],
            "version" : 1
          }
        '';
      };
    };
  };
}
