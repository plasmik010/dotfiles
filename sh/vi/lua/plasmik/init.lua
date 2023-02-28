-- vim: ts=2 sw=2
-- FYI: Use checkhealth to troubleshoot Neovim

-- print('hello from plasmik')
-- vim.opt.more = false
-- vim.api.nvim_command('echom 88')
-- vim.api.nvim_command('echom 88')

require("plasmik.set")
package.loaded['plasmik.helpy'] = nil
require("plasmik.helpy")

-- require("plasmik.remap")
H.reload('plasmik.remap')
require("plasmik.bootstrap")

-- disable netrw early in user/init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

------------------------
--  Configure Plugs   --
------------------{{{}}}


require("scrollbar").setup {
  handlers = {
    gitsigns = true, -- Requires gitsigns
  },
}

require("treesj").setup {
  use_default_keymaps = false,
  max_join_length = 440,
}

require("symbols-outline").setup()

require("nvim-autopairs").setup()
require("nvim-autopairs").remove_rule("'")
require("nvim-autopairs").remove_rule('"')

require("bufjump").setup {
  forward = "<A-i>",
  backward = "<A-o>",
  on_success = nil
}

local leap = H.prequire("leap")
if leap then
  leap.add_default_mappings()
  -- leap.opts.case_sensitive = true
  leap.opts.special_keys = {
    prev_target = { '<s-enter>', ',' },
    next_target = {'<enter>', ';'},
    -- prev_target = {'<tab>', ','},
    next_phase_one_target = '<enter>',
    repeat_search = '<enter>',
  }
end

require("gitsigns").setup()

require("tint").setup()

require("debugprint").setup()

-- H.unload('cinnamon')
require("cinnamon").setup( {
  -- KEYMAPS:
  default_keymaps = false,   -- Create default keymaps.
  extra_keymaps = false,    -- Create extra keymaps.
  extended_keymaps = false, -- Create extended keymaps.
  override_keymaps = false, -- The plugin keymaps will override any existing keymaps.
  -- OPTIONS:
  always_scroll = true,    -- Scroll the cursor even when the window hasn't scrolled.
  centered = true,          -- Keep cursor centered in window when using window scrolling.
  disabled = false,         -- Disables the plugin.
  default_delay = 5,        -- The default delay (in ms) between each line when scrolling.
  hide_cursor = false,      -- Hide the cursor while scrolling. Requires enabling termguicolors!
  horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
  max_length = 70,          -- Maximum length (in ms) of a command. The line delay will be re-calculated. Setting to -1 will disable this option.
  scroll_limit = 150,       -- Max number of lines moved before scrolling is skipped. Setting to -1 will disable this option.
})

-- nnoremap <silent> n :<C-u>execute "keepjumps norm! " . v:count1 . "nzz"<CR>

-- Half-window movements:
vim.keymap.set({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")
-- Page movements:
vim.keymap.set({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
vim.keymap.set({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
-- EXTRA_KEYMAPS:
-- Start/end of file and line number movements:
vim.keymap.set({ 'n', 'x' }, 'gg', "<Cmd>lua Scroll('gg')<CR>")
vim.keymap.set({ 'n', 'x' }, 'G', "<Cmd>lua Scroll('G', 0, 1)<CR>")
-- Paragraph movements:
vim.keymap.set({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
vim.keymap.set({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")
-- Previous/next search result:
vim.keymap.set('n', 'n', "<Cmd>lua Scroll('n', 1)<CR>")
vim.keymap.set('n', 'N', "<Cmd>lua Scroll('N', 1)<CR>")
vim.keymap.set('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
vim.keymap.set('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
-- vim.keymap.set('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
-- vim.keymap.set('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")
-- Previous/next cursor location:
vim.keymap.set('n', '<C-o>', "<Cmd>lua Scroll('<C-o>', 1)<CR>")
vim.keymap.set('n', '<C-i>', "<Cmd>lua Scroll('1<C-i>', 1)<CR>")
-- Screen scrolling:
vim.keymap.set('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
vim.keymap.set('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
vim.keymap.set('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
vim.keymap.set('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
vim.keymap.set('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
-- vim.keymap.set('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
-- vim.keymap.set('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")
-- Horizontal screen scrolling:
vim.keymap.set('n', 'zH', "<Cmd>lua Scroll('zH')<CR>")
vim.keymap.set('n', 'zL', "<Cmd>lua Scroll('zL')<CR>")
vim.keymap.set('n', 'zs', "<Cmd>lua Scroll('zs')<CR>")
vim.keymap.set('n', 'ze', "<Cmd>lua Scroll('ze')<CR>")
vim.keymap.set('n', 'zh', "<Cmd>lua Scroll('zh', 0, 1)<CR>")
vim.keymap.set('n', 'zl', "<Cmd>lua Scroll('zl', 0, 1)<CR>")
-- EXTENDED_KEYMAPS:
-- Left/right movements:
-- vim.keymap.set({ 'n', 'x' }, 'h', "<Cmd>lua Scroll('h', 0, 1)<CR>")
-- vim.keymap.set({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")
-- SCROLL_WHEEL_KEYMAPS:
vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")
-- LSP_KEYMAPS:
vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")
vim.keymap.set('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")

require("nvim-surround").setup()

require("lualine").setup {
  options = {
    section_separators = '',
    component_separators = '',
    theme = 'nord',
  },
}

require("bufferline").setup()
--[[ require("bufferline").setup {
    options = {
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    }
} ]]

require("neo-tree").setup {
  filesystem = {
    hijack_netrw_behavior = "open_default",
    -- "open_current",  
    -- "disabled", 
  }
}

require("syntax-tree-surfer")
-- Syntax Tree Surfer
local opts = { noremap = true, silent = false }
-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vU", function()
  vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vD", function()
  vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })
-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "vd", function()
  vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "vu", function()
  vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })
-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', opts)
vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', opts)
-- Select Nodes in Visual Mode
vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', opts)
vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', opts)
vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', opts)
vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', opts)
-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<A-j>", '<cmd>STSSwapNextVisual<cr>', opts)
vim.keymap.set("x", "<A-k>", '<cmd>STSSwapPrevVisual<cr>', opts)

require("Comment").setup()
-- require("yode-nvim").setup()

require("telescope").setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = {
        ["<c-a>"] = function() print("tryitout") end,
      }
    }
  }
}
require("telescope").load_extension('fzf')
-- local theme = require("telescope.themes").get_ivy()
-- theme['layout_config']['height'] = vim.opt.lines:get() - 8
-- theme['sort_mru'] = true
-- require("telescope.builtin").buffers(theme)
-- require("telescope.builtin").buffers(Tele_drop)

require("nvim-treesitter.configs").setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'python', 'vim', 'bash', 'help' },
  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [',al'] = '@parameter.inner',
      },
      swap_previous = {
        [',ah'] = '@parameter.inner',
      },
    },
  },
}
-- vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
require("indent_blankline").setup {
  filetype_exclude = {'lspinfo', 'checkhealth', 'help', 'man', '', 'startify'},
  enabled = false,
  show_end_of_line = false,
  show_current_context = true,
  -- show_current_context_start = true,
  show_trailing_blankline_indent = false,
  char = '░',
  char_blankline = "",
  context_char_blankline = "⋅",
  space_char_blankline = ' ',
  context_char = '│',
  -- ⋮ ⋅ ░ ∷
  -- ┊
}
-- let g:indent_blankline_buftype_exclude = ['terminal', 'nofile', 'quickfix', 'prompt', 'startify']
-- vim.g.indent_blankline_filetype_exclude = {'terminal', 'nofile', 'quickfix', 'prompt', 'help', 'startify'}

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=12, upper=18, builtin=8, bookmark=25 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = ""
  },
  mappings = {
    toggle = "m.",
    delete_line = "m-",
    delete_bookmark = "m=",
    next_bookmark = "s<Down>",
    prev_bookmark = "s<Up>",
    next = "a<Down>",
    prev = "a<Up>",
    next_bookmark1 = "1<Down>",
    prev_bookmark1 = "1<Up>",
    next_bookmark2 = "2<Down>",
    prev_bookmark2 = "2<Up>",
    next_bookmark3 = "3<Down>",
    prev_bookmark3 = "3<Up>",
    next_bookmark4 = "4<Down>",
    prev_bookmark4 = "4<Up>",
  }
}

-- n  m]          * <Cmd>lua require'marks'.next()<CR>
-- n  f<Up>       * <Cmd>lua require'marks'.prev_bookmark()<CR>

require("toggleterm").setup {
  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
  direction = 'horizontal',
  size = 24,
}

-- require("neoscroll").setup {
--   easing_function = "circular",
--   mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb'}
-- }
-- local t = {}
-- t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '400', [['cubic']]}}
-- t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '400', [['cubic']]}}
-- t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '600', [['circular']]}}
-- t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '600', [['circular']]}}
-- -- t['<C-y>'] = {'scroll', { -4, 'false', '250', "quadratic"}}
-- -- t['<C-e>'] = {'scroll', {  4, 'false', '250', "quadratic"}}
-- t['zt']    = {'zt', {'100'}}
-- t['zz']    = {'zz', {'100'}}
-- t['zb']    = {'zb', {'100'}}
-- require("neoscroll.config").set_mappings(t)

require("gomove").setup {
  -- whether or not to map default key bindings, (true/false)
  map_defaults = true,
  -- whether or not to reindent lines moved vertically (true/false)
  reindent = true,
  -- whether or not to undojoin same direction moves (true/false)
  undojoin = true,
  -- whether to not to move past end column when moving blocks horizontally, (true/false)
  move_past_end_col = false,
}

------------------------
--      Keymaps:      --
------------------{{{}}}

local tele_ivy = require("telescope.themes").get_ivy{ sort_mru = true, layout_config = { height = vim.opt.lines:get() - 10 } }
function Tele_buff_ivy() require("telescope.builtin").buffers( tele_ivy ) end
local tele_drop = require("telescope.themes").get_dropdown{ sort_mru=true, winblend=9, layout_config = { height=21 } }
function Tele_buff_drop() require("telescope.builtin").buffers( tele_drop ) end
H.nmap(',fb', Tele_buff_ivy, "Telescope [B]uffers ivy-themed")
H.nmap(',r', Tele_buff_ivy, "Telescope [B]uffers ivy-themed")
H.nmap(',<space>', Tele_buff_drop)
H.nmap(',l', require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
-- nnoremap ,<space> :Telescope buffers sort_mru=1 theme=dropdown winblend=9<CR>
H.nmap(',fh', require("telescope.builtin").help_tags, "Telescope [F]ind [H]elp_tags")
H.nmap(',fz', require("telescope.builtin").diagnostics, "Telescope [F]ind Diagnostics")
H.nmap(',fo', require("telescope.builtin").oldfiles, "Telescope [F]ind [O]ld files")
H.nmap(',fr', require("telescope.builtin").lsp_references, "Telescope [F]ind [R]eferences")
H.nmap('qf', "<cmd> call GetProjDir() <bar> exec 'Telescope find_files cwd=' . expand(b:proj_dir)<CR>", "[F]ind my text [F]iles")
H.nmap(',/',  ":Telescope find_files search_dirs=$sh,$tt,$loc<CR>")
H.nmap(',,/', ":Telescope find_files theme=ivy search_dirs=$sh,$PWD")
H.nmap(',fg', ":Telescope live_grep theme=ivy<CR>")
H.nmap(',fd', ":Telescope live_grep theme=ivy search_dirs=%<CR>")
H.nmap(',ff', ":Telescope find_files theme=ivy<CR>")
H.nmap('qr',  ":Telescope lsp_references theme=ivy<CR>")
H.nmap(',fs', ":Telescope lsp_document_symbols<CR>")
H.nmap('qs',  ":Telescope lsp_dynamic_workspace_symbols<CR>")
H.nmap(',vg', require("gitsigns").toggle_signs, "Show git highlight column")

-- nnoremap ,tt :Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout_config={"prompt_position":"top"}<CR>
-- nnoremap ,tt <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({sorting_strategy="ascending", theme="ivy"})<CR>

------------------------
--       LSP:         --
------------------{{{}}}

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

local masonpath
if vim.env.PLUGD then
  masonpath = H.path_join( vim.env.PLUGD , "..", "nvim-mason" )
  -- masonpath = H.path_join( vim.fn.stdpath"data", "nvim-mason" )
  masonpath = vim.fn.resolve(masonpath)
end

require("mason").setup {
  install_root_dir = masonpath,
}

require("mason-lspconfig").setup {
  -- ensure_installed = { "sumneko_lua", "clangd" }
  ensure_installed = { "lua_ls", "bashls", "clangd", "pyright", "cmake", "vimls" }
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
local nc_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig").bashls.setup { on_attach = function() print("lsp client is bashls") end, }
require("lspconfig").clangd.setup {
  on_attach = function(client, bufnr)
    -- navic.attach(client, bufnr)
    print("lsp client is clangd")
  end,
}
--[[ require("lspconfig").sumneko_lua.setup {
  -- on_attach = function() print("lsp client is sumneko_lua") end,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = { os.getenv("VIMRUNTIME") } },
    }
  },
} ]]
require("lspconfig").pyright.setup { on_attach = function() print("lsp client is pyright") end, capabilities = nc_capabilities }
require("lspconfig").cmake.setup { on_attach = function() print("lsp client is cmake") end, capabilities = nc_capabilities }
require("lspconfig").vimls.setup { on_attach = function() print("lsp client is vimls") end, capabilities = nc_capabilities }

-- blc = require("lspconfig").bashls.cmd

local lsp = require("lsp-zero")
lsp.preset("recommended")

require("lsp_lines").setup()
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({ virtual_text = false, })

------------------------
--     Completion:    --
------------------{{{}}}

vim.opt.completeopt={"menu", "noselect"}
-- vim.opt.completeopt={"menu", "menuone", "noselect"}

-- Turn on lsp status information
-- require("fidget").setup()

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-t>"] = cmp.mapping.complete(),
  ["<C-c>"] = cmp.mapping.abort(),

})

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  --[[ mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  } ]]
  mapping = cmp.mapping.preset.insert {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-e>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  },
  -- sources = cmp.config.sources({ }, { { name = 'buffer' } )
}

--[[ -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
      { name = 'buffer' },
    })
}) ]]

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--     sources = {
--     { name = 'buffer' }
--     }
-- })
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--     { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--         })
-- })

------------------------
------------------------
------------------{{{}}}

