{
  osConfig,
  lib,
  pkgs,
  ...
}:
let

  inherit (lib) optionals;
  inherit (osConfig.custom) minimal;

in
{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        auto-pairs = true;
        completion-trigger-len = 1;
        shell = [
          "bash"
          "-c"
        ];
        bufferline = "always";
        lsp = {
          enable = true;
        };
        auto-save = {
          focus-lost = true;
        };
        whitespace = {
          render = "all";
        };
        indent-guides = {
          render=true;
        };
        statusline = {
          left = [
            "spinner"
            "mode"
          ];
          center = [
            "read-only-indicator"
            "file-name"
            "file-modification-indicator"
          ];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "file-encoding"
          ];
        };

        file-picker={
          hidden = false;
        };

        inline-diagnostics={
          cursor-line = "hint";
          other-lines = "error";
        };
        smart-tab = true;
      };
    };
  };
  home.packages =
    with pkgs;
    optionals (!minimal) [

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
      markdown-oxide
      omnisharp-roslyn
      lua-language-server
      yaml-language-server
      bash-language-server
      svelte-language-server
      dockerfile-language-server
      typescript-language-server
      vscode-langservers-extracted
      docker-compose-language-service

      # debuggers
      lldb
      delve
    ];

  # home = {
  #   file = {
  #     ".config/helix" = {
  #       source = ./config;
  #     };
  #   };
  # };
}
