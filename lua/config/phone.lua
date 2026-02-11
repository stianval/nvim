local o = vim.o
o.cmdheight=0
o.shell = '/usr/bin/bash'
o.showcmdloc = 'statusline'
o.showtabline = 0

local map = vim.keymap.set
-- Model specific hacks for BOW keybard
map('', '`', '<esc>', {remap=true})
map('i', '`', '<esc>', {remap=true})
map('n', '<C-_>', 'gcc', { remap = true })
map('v', '<C-_>', 'gc', { remap = true })

require('local-utils')

augroup('color_commands', {}, function(autocmd)
  autocmd('ColorScheme', {
    callback = function(ev)
      vim.api.nvim_set_hl(0, 'CursorLineNr', {fg = 'lightgray'})
      vim.api.nvim_set_hl(0, 'CursorLine', {bg = '#292929'})
      vim.api.nvim_set_hl(0, 'Normal', {bg = '#000000'})
      vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', {sp='orange', undercurl=true})
    end
  })
end)

vim.cmd.colorscheme('bluloco-dark')
