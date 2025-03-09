{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      zig # treesitter
      ruff # lsp/fmt
  
      # lsp
      lua-language-server
      rust-analyzer cargo
      gopls
      typescript-language-server
      marksman
      vscode-langservers-extracted
  
      # fmt
      stylua
      rustfmt
      go # gofmt
      gotools # goimports
      mdformat
      prettierd
      stylelint
    ];
  };
}
