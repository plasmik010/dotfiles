-- vim: ts=2 sw=2

return {
  'mfussenegger/nvim-dap',
  {
    'rcarriga/nvim-dap-ui',
    event = "VeryLazy",
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    config = function()
      local dap = require'dap'
      dap.configurations.cpp = {
        {
          type = 'codelldb',
          request = 'launch',
          name = 'Launch file',
          -- cwd = vim.fn.system("dirname $(realpath build/binary)"),
          cwd = "build",
          -- program = "${file}",
          program = function()
            local path = vim.fn.input({
              prompt = 'Path to executable: ',
              default = vim.fn.getcwd() .. '/build/binary',
              completion = "file",
            })
            return (path and path ~= "") and path or dap.ABORT
          end,
        },
      }
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = "${file}",
          -- args = "-l scrub_tmplnmonetALblinktorrents_ready--mus -r scrub_homeplasmiklnmoblinkrecov",
          pythonPath = 'python',
          -- cwd = '/',
        }
      }
      local dapui = require'dapui'
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end

      H.nmap("zb",     "<cmd> DapToggleBreakpoint <CR>", "Add Breakpoint at line" )
      H.nmap("zn",     "<cmd> DapContinue <CR>", "Start or continue debugger" )
      H.nmap(",<BS>",  "<cmd> DapContinue <CR>", "Start or continue debugger" )
      H.nmap("<F5>",   "<cmd> DapContinue <CR>", "Start or continue debugger" )
      H.nmap("<F6>",   "<cmd> DapStepInto <CR>", "Debugger step Into" )
      H.nmap("<F7>",   "<cmd> DapStepOut  <CR>", "Debugger step Out" )
      H.nmap("<F8>",   "<cmd> DapStepOver <CR>", "Debugger step Over" )
      H.nmap("<F10>",   "<cmd> DapTerminate <CR>", "Debugger exit" )

    end
  },
  'mfussenegger/nvim-lint',
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      }
    },
  },
  'rcarriga/nvim-dap-ui',
  'niuiic/dap-utils.nvim',
  'nvim-telescope/telescope-dap.nvim',
}

--[[ vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end) ]]

