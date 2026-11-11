return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
      {'<leader>tf', '<cmd>Telescope find_files<cr>'},
      {'<leader>tq', '<cmd>Telescope quickfix<cr>'},
      {'<leader>tg', '<cmd>Telescope live_grep<cr>'},
  }
}
