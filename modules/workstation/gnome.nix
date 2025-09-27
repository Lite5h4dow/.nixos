{ pkgs, config, ... }:
let
  mimeAppsList = pkgs.writeTextFile {
    name = "gnome-mimeapps";
    destination = "/share/applications/mimeapps.list";
    text = ''
      [Default Applications]
      inode/directory=nautilus.desktop;org.gnome.Nautilus.desktop
    '';
  };
in
{
  environment = {
    systemPackages = with pkgs; [
      nautilus
      simple-scan
    ];

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    sessionVariables = {
      NAUTILUS_4_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
      XDG_DATA_DIRS = [ "${mimeAppsList}/share" ];
    };
  };

  services = {
    gvfs.enable = true;
    system-config-printer.enable = true;
    gnome.sushi.enable = true;
  };
}
