{pkgs, config, ...}:let
  inherit (config) mainUser; 
in {
  imports = [
    ./abbreviations.nix
    # ./aliases.nix
  ];

  users.users.${mainUser}.shell = pkgs.fish;

  programs.fish = {
    enable = true;

    plugins = with pkgs.fishPlugins; [
      { name = "autopair"; src = autopair.src; }
      { name = "sponge"; src = sponge.src; }
      { name = "done"; src = done.src; }
    ];
  };
}
