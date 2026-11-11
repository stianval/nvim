require('local-utils')
local orgmode = require('orgmode')

augroup('auto_org_clock_out', {}, function(autocmd)
  autocmd('VimLeavePre', {
    callback = function(ev)
        orgmode.action('clock.org_clock_goto')
        orgmode.action('clock.org_clock_out')
        vim.cmd.write()
    end
  })
end)
