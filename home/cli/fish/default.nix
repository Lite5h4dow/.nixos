{pkgs, lib ,osConfig, ...}:let
  inherit (lib) mkIf optionals;
  inherit (osConfig.custom) fish;
in {
  imports = optionals fish.enable [
    ./abbreviations.nix
    # ./aliases.nix
  ];
  config = mkIf fish.enable {

    home.shell.enableFishIntegration = true;

    programs={
      fish = {
        enable = true;
        plugins = with pkgs.fishPlugins; [
          { name = "autopair"; src = autopair.src; }
          { name = "sponge"; src = sponge.src; }
          { name = "done"; src = done.src; }
          # { name = "fzf"; src = fzf-fish.src; }
        ];

        # interactiveShellInit = ''
        #   atuin init fish | source
        #   starship init fish | source
        # '';
        # loginShellInit = ''
        #   starship init fish | source
        # '';
        # shellInit = ''
        #   starship init fish | source
        # '';
      };
      eza.enableFishIntegration = true;
    };
  };
}
