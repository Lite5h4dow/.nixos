{pkgs, ...}: {
  imports = [
    ./abbreviations.nix
    # ./aliases.nix
  ];

  programs.fish = {
    enable = true;

    plugins = with pkgs.fishPlugins; [
      { name = "autopair"; src = autopair.src; }
      { name = "sponge"; src = sponge.src; }
      { name = "done"; src = done.src; }
    ];
  };
}
