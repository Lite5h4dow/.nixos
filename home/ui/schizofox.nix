{inputs, ...}:
{
  imports = [inputs.schizofox.homeManagerModule];
  programs.schizofox = {
    enable = true;

    extensions = {
      # simplefox.enable = true;
      # darkreader.enable = true;
      # bitwarden.enable = true;
      extraExtensions = let
        mkUrl = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
      in {
        "{446900e4-71c2-419f-a6a7-df9c091e268b}".install_url = mkUrl "bitwarden-password-manager";
      };
    };
  };
}
