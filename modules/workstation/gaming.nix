{
  inputs,
  lib,
  config,
  flakePkgs,
  pkgs,
  ...
}: let
  inherit (pkgs.writers) writeDash;
  inherit (inputs.nix-gaming.nixosModules) pipewireLowLatency platformOptimizations;
  inherit (lib) types;
  cfg = config.custom.gaming;

  hyprctl = "${lib.getExe' flakePkgs.hyprland.default "hyprctl"} -i 0";
  powerprofilesctl = lib.getExe pkgs.power-profiles-daemon;
  notify-send = lib.getExe pkgs.libnotify;

  startScript = writeDash "gamemode-start" ''
    ${hyprctl} --batch "\
      keyword animations:enabled false; \
      keyword decoration:blur:enabled false; \
      keyword decoration:drop_shadow false; \
      keyword misc:vfr false; \
      keyword general:allow_tearing true; \
      keyword render:direct_scanout true; \
      keyword input:scroll_method '''"
    ${powerprofilesctl} set performance
    ${notify-send} --urgency=low --app-name='Gamemode' --icon=input-gaming 'Optimizations activated'
  '';
  endScript = writeDash "gamemode-end" ''
    ${hyprctl} reload
    ${powerprofilesctl} set balanced
    ${notify-send} --urgency=low --app-name='Gamemode' --icon=system-shutdown 'Optimizations deactivated'
  '';
in{
  imports = [
    pipewireLowLatency
    platformOptimizations
  ];

  options = {
    custom.gaming ={
      enable = lib.mkEnableOption {
        description = "Enable Gaming module";
        type = types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.permittedInsecurePackages = [
      "openssl-1.1.1w"
      "dotnet-sdk-6.0.428"
    ];

    environment={
      systemPackages = with pkgs;[
        openvr
        # alvr
        modrinth-app
      ];
    };

    services = {
      pipewire = {
        lowLatency.enable = true;
        alsa.support32Bit = true;
      };
    };

    hardware = {
      xpadneo.enable = true;
      graphics.enable32Bit = true;
    };

    security = {
      # rkit.enable = true;
    };

    programs = {
      gamescope = {
        enable = true;
        capSysNice = true;
      };

      steam = {
        enable = true;
        gamescopeSession.enable = true;

        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

        extraPackages = [pkgs.openssl_1_1];
        extraCompatPackages = [pkgs.proton-ge-bin];

        platformOptimizations.enable = true;
        protontricks.enable = true;
      };
    };
  };
}
