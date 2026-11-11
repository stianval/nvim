return {
  'nvim-treesitter/nvim-treesitter',
  tag = 'v0.10.0',
  lazy = false,
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'c', 'cpp', 'lua' },
    highlight = { enable = true },
  }
}
