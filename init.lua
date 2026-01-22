vim.cmd.filetype('plugin indent on')
local o = vim.o
o.tabstop = 8
o.shiftwidth = 4
o.expandtab = true
o.number = true
o.cursorline = true
o.signcolumn = 'yes'
o.splitright = true
o.splitbelow = true
o.foldlevelstart = 99
o.statuscolumn = '%C%l%s'
o.list = true
o.scrolloff = 5
vim.opt.sessionoptions:remove({'folds'})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map({'n', 't'}, '<C-5>', '<cmd>vertical term<cr><cmd>startinsert<cr>')
map({'n', 't'}, '<C-`>', '<cmd>horizontal term<cr><cmd>startinsert<cr>')

map('t', '<C-h>', '<C-\\><C-n><C-w>h')
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
map('t', '<C-k>', '<C-\\><C-n><C-w>k')
map('t', '<C-l>', '<C-\\><C-n><C-w>l')

map('c', '<C-a>', '<Home>')

map('n', '<C-x>', '<cmd>tab split<cr>')
map('n', '<leader>q', '<cmd>b# | bd#<cr>')

map('n', '<C-/>', 'gcc', { remap = true })
map('v', '<C-/>', 'gc', { remap = true })

require('local-utils')

function second_line_foldtext()
  local text = vim.fn.getline(vim.v.foldstart)
  if vim.v.foldstart + 1 < vim.v.foldend then
    local second_line = vim.fn.getline(vim.v.foldstart + 1)
    text = text .. string.gsub(second_line, '%s+', ' ')
  end
  text = text .. "  ... "
  local last_line = vim.fn.getline(vim.v.foldend)
  text = text .. string.gsub(last_line, '%s+', ' ')
  return text
end
vim.o.foldtext = "v:lua.second_line_foldtext()"

augroup('color_commands', {}, function(autocmd)
  autocmd('ColorScheme', {
    callback = function(ev)
      vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = 'black' })
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#f1f1f1' })
      vim.api.nvim_set_hl(0, 'DiagnosticUnnecessary', { sp='orange', undercurl=true })
    end
  })
end)

augroup('lsp_commands', {}, function(autocmd)
  autocmd('LspAttach', {
    callback = function(ev)
      map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {buffer = ev.buf})
      map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {buffer = ev.buf})
      map('n', '<F2>', '<cmd>lua vim.lsp.buf.definition()<cr>', {buffer = ev.buf})
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client.name == 'clangd' then
        map('n', '<F4>', '<cmd>LspClangdSwitchSourceHeader<cr>', {buffer = ev.buf})
      end
    end
  })

  -- autocmd('LspTokenUpdate', {
  --   callback = function(ev)
  --   end
  -- })
end)

augroup('fold_filetypes', {}, function(autocmd)
  autocmd('FileType', {
    pattern = {'c', 'cpp', 'lua'},
    callback = function(ev)
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  })
end)

vim.api.nvim_create_user_command('RC', 'edit $MYVIMRC', {})
vim.api.nvim_create_user_command('Plugins', 'edit ~/.config/nvim/lua/config/lazy-setup.lua', {})
vim.api.nvim_create_user_command('Wez', 'edit ~/.wezterm.lua', {})

require('config.lazy')
require('config.local')
