{
  pkgs,
  lib,
  config,
  ...
}: {
  systemd.user.services.polkit-authentication-agent = {
    description = "PolicyKit Authentication Agent";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.pantheon.pantheon-agent-polkit}/libexec/policykit-1-pantheon/io.elementary.desktop.agent-polkit";
    };
    wantedBy = ["graphical-session.target"];
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "gtk";
  };

  environment= {
    systemPackages = with pkgs;[
      alpaca
    ];
  };

  services = {
    gnome = {
      gnome-keyring.enable = true;
    };
    ollama = {
      enable = true;
      acceleration = lib.mkIf config.custom.graphics.nvidia.enable "cuda";
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider =
        if config.programs.gamemode.enable
        then
          pkgs.ananicy-rules-cachyos.overrideAttrs {
            preInstall = ''
              rm -r 00-default/games
            '';
          }
        else pkgs.ananicy-rules-cachyos;
    };
    power-profiles-daemon.enable = true;

    udisks2 ={
      enable = true;
      mountOnMedia = true;
    };

    gvfs = {
      enable = true;
    };

    devmon ={
      enable = true;
    };

    # printing = {
    #   enable = true;
    #   drivers = [pkgs.canon-cups-ufr2];
    # };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
