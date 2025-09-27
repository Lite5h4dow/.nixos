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
      gnome-system-monitor
      glib
      gnome-menus
    ];

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    sessionVariables = {
      # NAUTILUS_4_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
      XDG_DATA_DIRS = [ "${mimeAppsList}/share" ];
    };
  };
  xdg.mime.enable = true;
  services = {
    accounts-daemon.enable =true;
    gvfs = {
      enable = true;
      package = pkgs.gnome-gvfs;
    };
    system-config-printer.enable = true;
    gnome ={
      glib-networking.enable = true;
      sushi.enable = true;
      gnome-settings-daemon.enable = true;
      gnome-keyring.enable = true;
    };
    gnome-disks.enable = true;
  };

  programs = {
    nautilus-open-any-terminal={
      enable = true;
      terminal = "ghostty";
    };
  };
}
