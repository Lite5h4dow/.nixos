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
    zls
    nixd
    lldb
    ruff
    gopls
    taplo
    lsp-ai
    fortls
    nimlsp
    helm-ls
    terraform-ls
    omnisharp-roslyn
    rust-analyzer
    lua-language-server
    yaml-language-server
    typescript-language-server
    vscode-langservers-extracted
  ];

  home = {
    file = {
      ".config/helix" = {
        source = ./config;
      };
    };
  };
}
