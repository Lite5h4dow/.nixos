{
  imports = [./symbols.nix];
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      nix_shell.unknown_msg="shell";
      time = {
        disabled = false;
        time_format = "%R";
      };
    };
  };
}
