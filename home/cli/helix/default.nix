{ osConfig, lib, pkgs, ...}: let

  inherit (lib) optionals;
  inherit (osConfig.custom) minimal;

in {
  home.packages = with pkgs; [
    helix
  ]
  ++ optionals (!minimal) [

    # language servers
    nil
    zls
    nixd
    ruff
    gopls
    taplo
    hyprls
    lsp-ai
    fortls
    nimlsp
    helm-ls
    openscad-lsp
    terraform-ls
    glsl_analyzer
    rust-analyzer
    omnisharp-roslyn
    lua-language-server
    yaml-language-server
    bash-language-server
    svelte-language-server
    typescript-language-server
    vscode-langservers-extracted
    docker-compose-language-service
    dockerfile-language-server-nodejs


    # debuggers
    lldb
    delve
  ];

  home = {
    file = {
      ".config/helix" = {
        source = ./config;
      };
    };
  };
}
