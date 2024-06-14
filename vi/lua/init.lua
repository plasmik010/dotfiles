-- vim: ts=2 sw=2
-- FYI: Use checkhealth to troubleshoot Neovim

-- print('hello from init.lua')
-- vim.opt.more = false
-- vim.api.nvim_command('echom 88')
-- vim.cmd('echo 42' .. ' 101')

-- vim.cmd([[
--   vimscript here
-- ]])

-- package.loaded['name'] = nil
-- P = require('name')

-- vim.opt.rtp:prepend(vim.env.SOME_DIR)
-- print(vim.inspect(vim.api.nvim_list_runtime_paths()))


require('set')

require('helpy')

require('init_lazy')

-- is it needed ?
-- vim.api.nvim_command('set runtimepath+=$vi') -- Repair rtp after plugging

H.reload('completion')

H.reload('mappings')

H.reload('mapps')

local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
PL = lazy_config.plugins


  -------- Configure Plugs ---------------------{{{}}}------

-- I went lazy....

--[[ if H.is_available'themery' then
  Themes = vim.api.nvim_eval("getcompletion('','color')")
  H.tprint(Themes)
  require("themery").setup({ themes =  Themes  })
end ]]

-- vim.g.startify_custom_header = 'startify#pad(split(system("bash $vi/nvim-logo -b"),"\n"))'

