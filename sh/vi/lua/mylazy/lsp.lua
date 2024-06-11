-- vim: ts=2 sw=2

local masonpath
if vim.env.PLUGDIR then
  masonpath = H.path_join( vim.env.PLUGDIR , "..", "nvmsn" )
  -- masonpath = H.path_join( vim.fn.stdpath"data", "nvim-mason" )
  masonpath = vim.fn.resolve(masonpath)
end

vim.opt.rtp:prepend(vim.env.vi)

return
{
  {
    'VonHeikemen/lsp-zero.nvim',
    config = function()
      local lsp_zero = require'lsp-zero'.preset({})
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(
      function(client, bufnr)
        lsp_zero.default_keymaps { buffer = bufnr, preserve_mappings = false }
        print("lsp-zero added")
      -- require("nvim-navbuddy").attach(client, bufnr)
        -- require("nvim-navic").attach(client, bufnr)
        -- print("navbuddy & navic attached!")
      end
      )
    end
  },

  {
    'williamboman/mason.nvim', -- base --- load lang tools
    opts = {
      install_root_dir = masonpath,
    },
  },

  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
        'bashls',
        'clangd',
        'pyright',
        'cmake',
        'vimls',
      },

      handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
          require('lspconfig')[server_name].setup {
            on_attach = function() print(server_name, "attached as default") end,
          }
        end,

        bashls = function()
          require('lspconfig').bashls.setup {
            on_attach = function() print("lsp client is bashls") end,
          }
        end,
        pyright = function()
          require('lspconfig').pyright.setup {
            on_attach = function() print("lsp client is pyright") end,
            -- capabilities = nc_capabilities,
          }
        end,

        lua_ls = function()
          require('lspconfig').lua_ls.setup {
            -- require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())
            on_attach = function() print("lsp client is lua_ls") end,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { library = { os.getenv("VIMRUNTIME") } },
              }
            },
          }
        end,
      },
    },
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      -- H.sayhello()
      -- print(23)
      -- require'jo.joke2'
    end,
    dependencies = {
      'SmiteshP/nvim-navbuddy',
      'nvimdev/lspsaga.nvim',
    },
  },

  {
    'nvimdev/lspsaga.nvim', -- good
    enabled = false,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true
  },

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'amarakon/nvim-cmp-buffer-lines', -- dig
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
  },
}

  -------- Trad LSP setup ----------------------{{{}}}------

-- vim.lsp.set_log_level("debug")

--[[ local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
-- lsp_installer.joke =  vim.fn.stdpath "config" .. "/lsp_servers"
lsp_installer.settings({
  install_root_dir =  vim.fn.stdpath "config" .. "/lsp_servers",
})
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.capabilities = capabilities
  if server.name == "sumneko_lua" then
    -- vim.api.nvim_command('echom 88')
    opts = {
      -- cmd = { "~/.local/share/nvim/lsp_servers/sumneko_lua" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
  -- (optional) Customize the options passed to the server
  if server.name == "ccls" then
    -- opts.root_dir = function() print("ff") end
    opts.on_attach = function() print("ccls attached here!") end
  end
  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
  -- before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end) ]]


