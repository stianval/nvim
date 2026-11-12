return {
  'nvim-lualine/lualine.nvim',
  opts = {
    sections = {
      lualine_c = {
        function()
          n_tabs = #vim.fn.gettabinfo()
          if n_tabs == 1 then return '' end
          return '[' .. vim.fn.tabpagenr() .. '/' .. n_tabs .. ']'
        end,
        'filename',
      },
      lualine_x = {
        '%S',
        {'reg_recording', fmt = function(str) 
          if str == '' then return '' end 
          return '@' .. str
        end},
      },
      lualine_y = {
        {'datetime', style = '%a, %b %e | %H:%M'},
        'progress',
      },
    },
  },
}
