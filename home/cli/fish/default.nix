{pkgs, lib ,osConfig, ...}:let
  inherit (lib) mkIf optional;
  inherit (osConfig.custom) fish;
in {
  imports = optional fish.enable [
    ./abbreviations.nix
    # ./aliases.nix
  ];
  config = mkIf fish.enable {

    programs.fish = {
      plugins = with pkgs.fishPlugins; [
        { name = "autopair"; src = autopair.src; }
        { name = "sponge"; src = sponge.src; }
        { name = "done"; src = done.src; }
      ];
    };
  };
}
