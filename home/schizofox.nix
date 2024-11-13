{inputs, ...}:
{
  imports = [inputs.schizofox.homeManagerModule];
  programs.schizofox = {
    enable = true;

    extensions = {
      simplefox.enable = true;
      darkreader.enable = true;
      bitwarden.enable = true;
    };
  };
}
