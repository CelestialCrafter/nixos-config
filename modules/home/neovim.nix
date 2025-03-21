{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      clang # treesitter
      ruff # lsp/fmt

      # lsp
      lua-language-server
      rust-analyzer
      cargo
      rustc
      gopls
      nil
      typescript-language-server
      marksman
      vscode-langservers-extracted

      # fmt
      stylua
      rustfmt
      nixfmt-rfc-style
      go # gofmt
      gotools # goimports
      mdformat
      prettierd
      stylelint
    ];
  };
}
