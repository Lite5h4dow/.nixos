{inputs, ...}:
{
  imports = [inputs.schizofox.homeManagerModule];
  programs.schizofox = {
    enable = true;

    extensions = {
      bitwarden.enable = true;
    };
  };
}
