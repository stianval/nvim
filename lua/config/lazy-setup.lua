-- vim: fdl=2 fdm=expr

-- local local_plugins = "plugins.mobile"

local lazy_spec = {
  { import = "plugins" },
}

if local_plugins then
    table.insert(lazy_spec, { import = local_plugins })
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = lazy_spec,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})
