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
      opts = {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 100,
        }
      }
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
    {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = { 'rafamadriz/friendly-snippets' },

      -- use a release tag to download pre-built binaries
      version = '1.*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    {
      'tpope/vim-fugitive',
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})
