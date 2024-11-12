{
  imports = [./symbols.nix];
  programs.startship = {
    enable = true;
    enableFishIntegration = false;

    settings = {
      nix_shell.unknown_msg="shell";
      time = {
        disabled = false;
        time_format = "%R";
      };
    };
  };
}
