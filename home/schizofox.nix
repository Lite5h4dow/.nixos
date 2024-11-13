{inputs, ...}:
{
  imports = [inputs.schizofox.homeManagerModule];
  programs.schizofox = {
    enable = true;

    extensions = {
      simplefox.enable = true;
      darkreader.enable = true;

      extraExtensions = {
        "webextension@bitwarden.com".install_url = "https://addons.mozilla.org/firefox/downloads/file/4371752/bitwarden_password_manager-2024.10.1.xpi";
      };
    };
  };
}
