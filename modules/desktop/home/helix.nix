{ pkgs, inputs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default;

    extraPackages = with pkgs; [
      lldb # debugger
      ruff # python
      tinymist typstyle # typst
      stylua lua-language-server # lua
      rust-analyzer rustfmt rustc cargo clippy # rust
      gopls golangci-lint golangci-lint-langserver go # go
      nil nixfmt # nix
      typescript-language-server # javascript
      nodePackages.prettier # javascript, html, css, scss, json, svelte
      marksman mdformat # marksman
      clang clang-tools # c
      svelte-language-server # svelte
    ];
  };
}
