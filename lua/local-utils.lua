function augroup(name, opts, autocmd_definitions_callback)
  group = vim.api.nvim_create_augroup(name, opts)
  function autocmd(events, opts)
    opts.group = group
    vim.api.nvim_create_autocmd(events, opts)
  end
  autocmd_definitions_callback(autocmd)
end

