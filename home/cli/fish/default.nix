{pkgs, lib ,osConfig, ...}:let
  inherit (lib) mkIf;
  inherit (osConfig.custom) fish;
in {
  config = mkIf fish.enable {
    imports = [
      ./abbreviations.nix
      # ./aliases.nix
    ];

    programs.fish = {
      plugins = with pkgs.fishPlugins; [
        { name = "autopair"; src = autopair.src; }
        { name = "sponge"; src = sponge.src; }
        { name = "done"; src = done.src; }
      ];
    };
  };
}
