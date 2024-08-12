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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require('fetch_lazy')

-- Install and configure plugins,
-- source configs from specified directory
--
-- vim.api.nvim_command('set runtimepath+=$vi') -- set rtp once again...
-- vim.cmd ([[ echom 82  &runtimepath ]])
--
require'lazy'.setup(
    { import = "mylazy" },
    {
        root = vim.env.PLUGDIR,
        change_detection = { enabled = false },
    }
)

H.reload('completion')

H.reload('mappings')

H.reload('mapps')

local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
PL = lazy_config.plugins


