{
  config,
  ...
}: let 
  inherit (config.values) mainUser;
in {
  environment = {
    systemPackages =  with pkgs; [
      helix

      # language servers
      nil
      gopls
      fortls
      nimlsp
      terraform-ls
      yaml-language-server
      nodePackages_latest.typescript-language-server
      nodePackages_latest.vscode-html-languageserver-bin
      nodePackages_latest.vscode-css-languageserver-bin
      nodePackages_latest.vscode-json-languageserver
      python312Packages.python-lsp-server
    ];
  };

  home-manager.users.${mainUser} = {
    home = {
      file = {
        ".config/helix" = {
          source = config.lib.file.mkOutOfStoreSymlink ./config;
        };
      };
    };
  };
}
