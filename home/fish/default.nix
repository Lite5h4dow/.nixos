{pkgs, ...}: {
  imports = [
    ./abbreviations.nix
    # ./aliases.nix
  ];

  programs.fish = {
    enable = true;

    # plugins = with pkgs.fishPlugins; [
    #   autopair.src
    #   sponge.src
    #   done.src
    # ];
  };
}
