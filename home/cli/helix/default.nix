{
  config,
  pkgs,
  ...
}: let
  inherit (config.values) mainUser;
in {
  home.packages = with pkgs; [
    helix

    # language servers
    nil
    gopls
    fortls
    nimlsp
    terraform-ls
    yaml-language-server
    # vscode-langserves-extracted
    nodePackages_latest.typescript-language-server
    # nodePackages_latest.vscode-html-languageserver-bin
    # nodePackages_latest.vscode-css-languageserver-bin
    # nodePackages_latest.vscode-json-languageserver
    python312Packages.python-lsp-server
    omnisharp-roslyn
    lsp-ai
  ];

  home = {
    file = {
      ".config/helix" = {
        source = ./config;
      };
    };
  };
}
