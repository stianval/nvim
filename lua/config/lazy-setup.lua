-- vim: fdl=2 fdm=expr

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      'uloco/bluloco.nvim',
      lazy = false,
      priority = 1000,
      dependencies = { 'rktjmp/lush.nvim' },
      config = function()
        require('bluloco').setup({
          style = 'light',               -- 'auto' | 'dark' | 'light'
          transparent = false,
          italics = true,
          terminal = vim.fn.has('gui_running') == 1, -- bluoco colors are enabled in gui terminals per default.
          guicursor = true,
          rainbow_headings = false,     -- if you want different colored headings for each heading level
        })

        vim.opt.termguicolors = true
        vim.cmd.colorscheme('bluloco')
      end,
    },
    {
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
    },
    {
      'nvim-treesitter/nvim-treesitter',
      tag = 'v0.10.0',
      lazy = false,
      build = ':TSUpdate',
      main = 'nvim-treesitter.configs',
      opts = {
        ensure_installed = { 'c', 'cpp', 'lua' },
        highlight = { enable = true },
      }
    },
    {
      'nvim-treesitter/nvim-treesitter-context',
      lazy = false,
      main = 'treesitter-context',
      opts = {
        enable = true,
        mode = 'topline',
      },
    },
    {
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
    },
    {
      'lewis6991/gitsigns.nvim',
    },
    {
      'hiphish/rainbow-delimiters.nvim',
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
    },
    {
      'stevearc/overseer.nvim',
      opts = {},
    },
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      config = true
    },
    {
      'mfussenegger/nvim-dap',
    },
    {
      'nvim-lua/plenary.nvim',
    },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
