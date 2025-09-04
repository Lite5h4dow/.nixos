{ pkgs, inputs, ... }:  {
  programs.command-not-found.enable =  false;

  # services.teamviewer.enable = true;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      nss
      rclone
      go-mtpfs
      obsidian
      steam-run
      wl-clipboard
      resilio-sync
      bitwarden-desktop
      ungoogled-chromium
      inputs.lobster.packages.${pkgs.system}.lobster
      inputs.curd.packages.${pkgs.system}.default
    ];
  };
}
