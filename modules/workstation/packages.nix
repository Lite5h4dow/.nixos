{ pkgs, inputs, ... }:  {
  programs.command-not-found.enable =  false;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    systemPackages = with pkgs; [
      obsidian
      steam-run
      wl-clipboard
      bitwarden-desktop
      ungoogled-chromium
      inputs.lobster.packages.${pkgs.system}.lobster-rs
      inputs.curd.packages.${pkgs.system}.default
    ];
  };
}
