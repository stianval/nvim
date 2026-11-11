return {
  'neovim/nvim-lspconfig',
  lazy = false,
  config = function()
    vim.lsp.config.clangd = {
      cmd = {
        'clangd',
        '-header-insertion=never',
      },
    }
    vim.lsp.enable('clangd')
  end
}
