return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_x = {'datetime'},
    },
    winbar = {
      lualine_b = {{'filename', path = 1}},
      lualine_y = {'encoding','fileformat','filetype'},
    },
    inactive_winbar = {
      lualine_b = {{'filename', path = 1}},
      lualine_y = {'encoding','fileformat','filetype'},
    }
  }
}
