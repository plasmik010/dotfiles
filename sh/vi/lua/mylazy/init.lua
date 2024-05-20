-- vim: ts=2 sw=2

-- MOST PLUGINS ARE INVOKED AND CONFIGURED ACCORDING TO THIS FILE --

return {

  -- require'mylazy.better-escape',
  -- require'mylazy',
  -- { import = "mylazy" },

  ---- VIM BASIC -------------------------------------------
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } }, -- fantastic
  -- 'mhinz/vim-startify', -- great
  -- 'justinmk/vim-sneak', -- good!
  -- 'tpope/vim-sensible', -- basic
  -- 'tpope/vim-endwise', -- okay
  -- 'tpope/vim-sleuth',
  'tpope/vim-repeat', -- handy
  'tpope/vim-eunuch', -- handy
  'tpope/vim-fugitive', -- handy
  'jlanzarotta/bufexplorer', -- based
  'MattesGroeger/vim-bookmarks', -- great
  'haya14busa/vim-edgemotion', -- great --- Use with <C-j>
  'will133/vim-dirdiff', -- handy
  'jamessan/vim-gnupg', -- good --- vim-only
  -- 'chrisbra/Colorizer', -- good
  -- 'michaeljsmith/vim-indent-object', -- cool
  -- 'godlygeek/tabular', -- okay
  -- 'junegunn/vim-easy-align', -- usable
  -- 'vim-scripts/QuickBuf',
  -- 'derekwyatt/vim-fswitch',

  ------- NEOVIM ONLY --------------------------{{{}}}------

  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        prompt_prefix = "$ ",
        mappings = {
          i = {
            ["<c-a>"] = function() print("tryitout") end,
          }
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        fzf = {
          fuzzy = false,                   -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- "smart_case" or "ignore_case" or "respect_case"
        }
      }
    },
    config = function(_,opts)
      require'telescope'.setup(opts)
      require'telescope'.load_extension('fzf')
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  'nvim-lua/plenary.nvim', --- library
  'powerman/vim-plugin-ruscmd', -- works

  'williamboman/mason.nvim', -- base --- load lang tools
  'williamboman/mason-lspconfig.nvim',

  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-lint',
  'jay-babu/mason-nvim-dap.nvim',
  'rcarriga/nvim-dap-ui',
  'niuiic/dap-utils.nvim',

  'nvim-telescope/telescope-dap.nvim',

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { 'c', 'cpp', 'lua', 'python', 'vim', 'bash', 'markdown' },
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
          keymaps = { -- todo
            -- init_selection =    '<c-space>',
            -- node_incremental =  '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental =  '<c-backspace>',
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
              ['[o'] = '@class.outer',
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
      vim.cmd("silent TSUpdate")
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'SmiteshP/nvim-navbuddy',
      'nvimdev/lspsaga.nvim',
    },
  },

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'}, -- dig
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

  {
    'SmiteshP/nvim-navbuddy', -- cool --- code map (call :Navbuddy)
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim'
    },
    opts = { lsp = { auto_attach = true } }
  },
  {
    'SmiteshP/nvim-navic', -- good --- Nav string
    opts = { lsp = { auto_attach = true } }
  },
  {
    'utilyre/barbecue.nvim', -- maybe
    enabled = true,
    dependencies = { 'SmiteshP/nvim-navic' },
    name = "barbecue",
    version = "*",
    opts = {
      exclude_filetypes = { "netrw", "toggleterm", "" },
    },
  },

  'kevinhwang91/rnvimr', --- use ranger

  {
    'chentoast/marks.nvim', -- great --- better marks and more
    opts = {
      default_mappings = false,
      builtin_marks = { "^" }, -- which builtin marks to show
      cyclic = true,
      force_write_shada = true, -- whether the shada file is updated after modifying uppercase marks
      refresh_interval = 250,
      sign_priority = { lower=12, upper=18, builtin=8, bookmark=25 },
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
        next = "t<Down>",
        prev = "t<Up>",
        set_bookmark0 = "m0",
        set_bookmark1 = "m1",
        set_bookmark2 = "m2",
        set_bookmark3 = "m3",
        set_bookmark4 = "m4",
        next_bookmark = ",<Down>",
        prev_bookmark = ",<Up>",
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
  },

  'lambdalisue/suda.vim', -- perfect --- Sudo file operations

  {
    'declancm/cinnamon.nvim', -- works --- Hacky Smooth Scroll
    opts = {
      default_keymaps = false,  -- Create default keymaps.
      extra_keymaps = false,    -- Create extra keymaps.
      extended_keymaps = false, -- Create extended keymaps.
      override_keymaps = false, -- The plugin keymaps will override any existing keymaps.
      always_scroll = true,     -- Scroll the cursor even when the window hasn't scrolled.
      centered = true,          -- Keep cursor centered in window when using window scrolling.
      disabled = true ,         -- Disables the plugin.
      default_delay = 5,        -- The default delay (in ms) between each line when scrolling.
      hide_cursor = false,      -- Hide the cursor while scrolling. Requires enabling termguicolors!
      horizontal_scroll = true, -- Enable smooth horizontal scrolling when view shifts left or right.
      max_length = 70,          -- Maximum length (in ms) of a command. The line delay will be re-calculated. Setting to -1 will disable this option.
      scroll_limit = 150,       -- Max number of lines moved before scrolling is skipped. Setting to -1 will disable this option.
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', 'gennaro-tedesco/nvim-possession' },
    priority = 40,
    opts = {
      sections = {
        lualine_c = {
          {
            'filename',
            path = false,
            color_correction = 'dynamic',
            -- "navic",
            -- color_correction = 'dynamic',
            -- navic_opts = nil
          },
          {
            H.auxfun1,
            -- function() require'nvim-possession'.status() end,
            cond = function()
              return require("nvim-possession").status() ~= nil
            end,
          },
        }
      },
      options = {
        -- section_separators = '',
        component_separators = '',
        theme = 'nord',
        -- theme = 'nordic',
      },
    },
  },

  {
    'akinsho/bufferline.nvim',
    version='*',
    dependencies='kyazdani42/nvim-web-devicons',
    opts = {
      options = {
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        }
      }
    }
  },

  {
    'windwp/nvim-autopairs',
    enabled = false,
    config = function()
      local pl = require('nvim-autopairs')
      pl.setup()
      pl.remove_rule("'")
      pl.remove_rule('"')
    end,
  },

  --[[ {
    'm4xshen/autoclose.nvim', -- problem
    config = true
  }, ]]

  {
    'kylechui/nvim-surround', -- okay --- classics remake
    config = true
  },

  {
    'nvim-neo-tree/neo-tree.nvim', -- almost great
    dependencies = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
        -- "open_current",
        -- "disabled",
      }
    }
  },

  {
    'numToStr/Comment.nvim', -- good --- hit 'gcc' to comment
    config = true
  },

  {
    'akinsho/toggleterm.nvim', -- great --- fast terminal
    opts = {
      -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
      direction = 'float',
      start_in_insert = true,
      autochdir = true,
      size = 24,
      persist_size = true,
      persist_mode = true,
      open_mapping = [[<a-;>]],
    },
  },

  -- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


  -- {
  --   'lukas-reineke/indent-blankline.nvim', -- broken
  --   main = "ibl",
  --   enabled = true,
  --   config = function()
  --     -- local lochl = { "CursorColumn", "Whitespace", "WildMenu" }
  --     local lochl = { "CursorColumn", "CursorColumn", "WildMenu" }
  --     require'ibl'.setup {
  --       exclude = { filetypes = {'dashboard'}},
  --       -- {'lspinfo', 'checkhealth', 'help', 'man', '', 'startify'}
  --       -- {'terminal', 'nofile', 'quickfix', 'prompt', 'help', 'startify'}
  --       indent = {
  --         highlight = { "WildMenu", "WildMenu" },
  --         -- highlight = lochl,
  --         char = " ",
  --         -- ┊ │ ⋮ ⋅ ░ ∷
  --       },
  --       scope = {
  --         highlight = lochl,
  --         char = "│",
  --       },
  --       -- whitespace = { highlight = highlightL, remove_blankline_trail = false },
  --     }
  --   end,
  -- },
  --
  'folke/which-key.nvim',

  'norcalli/nvim-colorizer.lua',

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim', -- cool --- multiline lsp hints
    config = function()
      -- turn it off on start
      require'lsp_lines'.toggle()
      require'lsp_lines'.toggle()
      require'lsp_lines'.setup()
      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({virtual_text = false})
    end,
    -- keys = ",l",
  },


  {
    'folke/trouble.nvim',
    config = true
  },

  {
    'andrewferrier/debugprint.nvim', -- handy! --- auto insert logging lines
    config = true
  },

  'LukasPietzschmann/telescope-tabs', -- usable

  {
    'ziontee113/syntax-tree-surfer', --- move with TS
    config = function()
      require("syntax-tree-surfer").setup()
      local noresil = { noremap = true, silent = false }
      -- Normal Mode Swapping:
      -- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
      vim.keymap.set("n", "vU", function()
        vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      vim.keymap.set("n", "vD", function()
        vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      -- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
      vim.keymap.set("n", "vd", function()
        vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      vim.keymap.set("n", "vu", function()
        vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot" return "g@l" end,
        { silent = true, expr = true })
      -- Visual Selection from Normal Mode
      vim.keymap.set("n", "vx", '<cmd>STSSelectMasterNode<cr>', noresil)
      vim.keymap.set("n", "vn", '<cmd>STSSelectCurrentNode<cr>', noresil)
      -- Select Nodes in Visual Mode
      vim.keymap.set("x", "J", '<cmd>STSSelectNextSiblingNode<cr>', noresil)
      vim.keymap.set("x", "K", '<cmd>STSSelectPrevSiblingNode<cr>', noresil)
      vim.keymap.set("x", "H", '<cmd>STSSelectParentNode<cr>', noresil)
      vim.keymap.set("x", "L", '<cmd>STSSelectChildNode<cr>', noresil)
      -- Swapping Nodes in Visual Mode
      vim.keymap.set("x", "<C-Right>", '<cmd>STSSwapNextVisual<cr>', noresil)
      vim.keymap.set("x", "<C-Left>", '<cmd>STSSwapPrevVisual<cr>', noresil)
      vim.keymap.set("x", "<S-Right>", '<cmd>STSSwapNextVisual<cr>', noresil)
      vim.keymap.set("x", "<S-Left>", '<cmd>STSSwapPrevVisual<cr>', noresil)
    end
  },

  {
    'booperlv/nvim-gomove', --- move keep indent
    opts = {
      map_defaults = true,
      reindent = true,
      undojoin = true,
      move_past_end_col = false,
    }
  },

  {
    'kwkarlwang/bufjump.nvim', -- good --- jump in history a buffer at once
    -- mapping problem!
    enabled = false,
    config = function()
      require'bufjump'.setup {
        forward = "<A-i>",
        backward = "<A-o>",
        on_success = nil
      }
    end
  },

  'sindrets/diffview.nvim', -- great --- cycle through diffs

  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      local hop = require('hop')
      hop.setup { keys = 'etovxqpdygfblzhckisuran' }
      local directions = require('hop.hint').HintDirection
      -- vim.keymap.set('n', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
      -- vim.keymap.set('n', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
      -- vim.keymap.set('n', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
      -- vim.keymap.set('n', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, {remap=true})
    end,
  },

  {
    'simrat39/symbols-outline.nvim', -- okay --- symbols tree based on lsp
    config = true
  },

  'gennaro-tedesco/nvim-peekup', -- so-so --- clipboard history,  usage:""

  {
    'trmckay/based.nvim', --- decode hex and octal to decimal
    enabled = false,
    config = function()
      H.nmap(",cb", require'based'.convert)
    end
  },

  {
    'petertriho/nvim-scrollbar', -- okay
    config = function()
      require("scrollbar").setup()
      H.nmap(',vs', ":ScrollbarToggle<CR>")
    end
  },

  {
    'Wansmer/treesj', -- great --- split/join
    opts = {
      use_default_keymaps = false,
      max_join_length = 440,
    }
  },

  {
    'levouh/tint.nvim', -- okay --- fade inactive windows
    opts = {
      tint = -18,
      saturation = 0.7
    },
    config = function(_, opts)
      local tint = require("tint")
      tint.setup(opts)
      tint.disable()
    end
  },

  -- { 'echasnovski/mini.splitjoin', version = '*' },

  {
    'echasnovski/mini.files',
    version = false,
    -- config = true,
    config = function()
      require("mini.files").setup {
        mappings = {
          go_in = 'L',
          go_in_plus = 'l',
        },
        options = {
          use_as_default_explorer = false,
        },
      }
      H.nmap(",h", function() MiniFiles.open(vim.api.nvim_buf_get_name(0),false) end) -- open at current file
      -- H.nmap(",h", MiniFiles.open)
    end
  },

  'tamton-aquib/zone.nvim', -- fun --- joke screensaver

  {
    'https://gitlab.com/HiPhish/nvim-ts-rainbow2', -- okay
    enabled = false,
    config = function()
      H.nmap(',vr', ":TSToggle rainbow<CR>")
    end
  },
  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim', -- newest
    enabled = false,
    config = function()
      vim.g.rainbow_delimiters = {whitelist = {'cpp','bash','lua'}}
      require 'rainbow-delimiters.setup'
    end
  },

  {
    'gaoDean/autolist.nvim', --- Bullets
    priority = 80,
    ft = { "markdown", "text", "" },
    opts = {
      cycle = { "-", "*", "+", "1.", "1)", "a)", "I." }
    },
    config = function(_, opts)
      require'autolist'.setup(opts)
      vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
      vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
      -- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
      vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
      vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
      vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
      -- vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
      -- vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")
      vim.keymap.set("n", "c,", require("autolist").cycle_next_dr, { expr = true })
    end,
  },

  {
    'zaldih/themery.nvim',
    priority = 90,
    config = function()
      function ThemeryWrapper()
        if H.is_available "themery.nvim" then
          if not H.Themes then
            H.Themes = vim.api.nvim_eval("getcompletion('','color')")
            print("Themes list updated")
            require("themery").setup({ themes =  H.Themes  })
          else
            print("Themes is")
          end
          -- H.tprint(H.Themes)
          vim.cmd("Themery")
        else
          print'no avail'
        end
      end
      H.nmap(',,t', ThemeryWrapper)
    end
  },

  {
    'gorbit99/codewindow.nvim', -- good --- fat minimap
    opts = {
      minimap_width = 16,
      width_multiplier = 5,
    },
    config = function(_, opts)
      require'codewindow'.setup(opts)
      H.nmap(',vm', require'codewindow'.toggle_minimap)
    end
  },

  'nullchilly/fsread.nvim', -- funky --- read fast

  ------ Tryout --------------------------------{{{}}}------

  {
    'NStefan002/speedtyper.nvim',
    cmd = "Speedtyper",
    opts = {},
  },

  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  {
    'junegunn/vim-easy-align',
    config = function()
      -- H.nmap('ga', '<Plug>(EasyAlign)')
      vim.keymap.set('n', 'ga',  '<Plug>(EasyAlign)')
      vim.keymap.set('x', 'ga',  '<Plug>(EasyAlign)')
    end
  },

  {
    'michaelb/sniprun', -- maybe --- REPL
    build = 'sh ./install.sh',
    enabled = "false",
    opts = {
      display = {
        "Classic",
        -- "Terminal",
        "VirtualText",
      }
    }
  },

  --[[ {
    'abecodes/tabout.nvim',
    enabled = false,
    config = true,
  }, ]]

  {'jvgrootveld/telescope-zoxide'},

  'folke/paint.nvim',
  'folke/styler.nvim', --- colo per filetype

  'LintaoAmons/scratch.nvim',

  {
    'j-hui/fidget.nvim',
    enabled = false,
    tag = 'legacy',
    config = true,
  },

  'cbochs/portal.nvim', -- problem
  'ziontee113/neo-minimap', -- nice --- cool tags map
  'princejoogie/dir-telescope.nvim',
  'pocco81/true-zen.nvim',

  {
    'rbong/vim-flog', --- provides git graph
    dependencies = 'tpope/vim-fugitive',
  },

  {
    'NeogitOrg/neogit', -- problem
    enabled = false,
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
  },

  {
    'lewis6991/gitsigns.nvim', -- cool
    config = function()
      require("gitsigns").setup()
      require("scrollbar.handlers.gitsigns").setup() -- take it to scrollbar
    end,
  },

  {
    'folke/flash.nvim', -- problem
    enabled = false,
    config = 'require("flash").setup()'
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

  {
    'tzachar/local-highlight.nvim',
    enabled = false,
    opts = {
      -- file_types = {'python', 'cpp'}, -- If this is given only attach to this
      -- OR attach to every filetype except:
      -- disable_file_types = {'tex'},
      hlgroup = 'Search',
      cw_hlgroup = nil,
    },
  },

  { 'echasnovski/mini.cursorword' },

  -- 'RRethy/vim-illuminate', --- highlight current word

  {
    'dvoytik/hi-my-words.nvim', --- highlight words you wish
    config = true
  },

  {
  'chrisgrieser/nvim-spider', -- works --- better word margins
    enabled = false,
    config = function()
      vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },

  {
    'ecthelionvi/NeoColumn.nvim', -- okay --- highlight long lines
    opts = {
      -- bg_color = "878787"
      fg_color = "",
      bg_color = "",
      NeoColumn = "100",
      custom_NeoColumn = { bash = "120"},
      excluded_ft = { "text", "markdown" },
    }
  },

  {
    'norlock/nvim-traveller',
    enabled = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    opts = {
      -- replace_netrw = true,
      sync_cwd = true,
    },
    config = function(_, opts)
      local traveller = require("nvim-traveller")
      traveller.setup(opts)
      vim.keymap.set('n', '_', traveller.open_navigation, {})
      -- Really fast navigation through directories with traveller compatibility
      vim.keymap.set('n', '<leader>d', traveller.open_telescope_search, silent_options)
    end
  },

  {
    'tzachar/highlight-undo.nvim',
      config = function()
      require('highlight-undo').setup {
        duration = 1400,
      }
    end
  },

  { 'prochri/telescope-all-recent.nvim', dependencies = {'kkharji/sqlite.lua'} },

  {
    'AckslD/nvim-neoclip.lua', -- problem
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = true,
  },

  {
    'nvimdev/dashboard-nvim',
    -- enabled = false,
    event = 'VimEnter',
    config =  true,
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = {
      theme = 'hyper',
      -- preview = { file_path = H.vidir .. 'logo/neovim2.cat', file_height = 11, file_width = 75, command = 'cat | lolcat -F .08' },
      config = {
        -- week_header = { enable = false },
        -- header = {'iiii'},
        header = {

 -- ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
 -- ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
 -- ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
 -- ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
 -- ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
 -- ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',

'                                                                         ',
'          ███████████          █████      ██                       ',
'         ███████████            █████                               ',
'         ███████████████████████████ ███   ███████       ',
'        ████████████████████████████ █████ ██████████████     ',
'       ██████████████   █████████████ █████ █████ ████ █████     ',
'    ██████████████████████████████████ █████ █████ ████ █████    ',
'   ██████  ███ █████████████████ ████ █████ █████ ████ ██████   ',
'   ',
        },

        shortcut = {
          -- 󰅏 󰅐   
          {
            icon = '󰅏 ',
            icon_hl = '@variable',
            desc = 'Sess',
            group = 'Number',
            -- desc_hl = 'String',
            action = "require'nvim-possession'.list()",
            key = 's',
          },
          {
            icon = '󰊳 ',
            icon_hl = '@variable',
            desc = 'Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Number',
            -- group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          -- { desc = ' Apps', group = 'DiagnosticHint', action = 'Telescope app', key = 'a' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Recent',
            group = 'Number',
            action = 'Telescope oldfiles',
            key = 'o',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'dotfiles',
            group = 'Number',
            action = 'require"telescope.builtin".find_files({ search_dirs={ os.getenv("loc"), os.getenv("sh"), os.getenv("tt") } }) ',
            key = 'd',
          },
          -- {
          --   desc = 'Exit',
          --   action = 'vim.cmd([[q!]])',
          --   key = 'q',
          -- },
          {
            icon = ' ',
            desc = 'New',
            action = 'vim.cmd.enew()',
            key = 'e',
          },
        },
        packages = { enable = true },
        project = {
          enable = true,
          limit = 4,
          -- icon = ' ',
          -- label = '',
          action = 'Telescope find_files cwd=',
        },
        mru = {
          enable = true,
          limit = 12,
          icon = ' ',
          -- label = '',
        },
        footer = {'',' Do one thing, do it well'},
      },
    }

  },

  {
    'goolord/alpha-nvim',
    enabled = false,
    event = "VimEnter",
    dependencies = 'kyazdani42/nvim-web-devicons',
    --[[ opts = function()
      local dashboard = require('alpha.themes.dashboard')
      require('alpha.term')
      dashboard.section.terminal.command = "bash $vi/nvim-logo -o"
      dashboard.section.terminal.width = 70
      dashboard.section.terminal.height = 10
      dashboard.section.terminal.opts.redraw = true
      dashboard.section.terminal.opts.window_config.zindex = 1
      dashboard.opts.layout = {
        dashboard.section.terminal,
        { type = "padding", val = 4 },
        dashboard.section.buttons,
        dashboard.section.footer,
      }
      return dashboard
    end, ]]
    -- config = function() require'alpha'.setup(require'alpha.themes.startify'.config) end,
    -- config = function(_, dashboard)
      -- require('alpha').setup(dashboard.opts)
    -- end,
    -- try----https://github.com/MiaadTeam/lesvim/blob/main/lua/lazy/settings/alpha.lua
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },

  {
    "gennaro-tedesco/nvim-possession", -- works
    dependencies = { "ibhagwan/fzf-lua" },
    config = true,
    opts = {
      autosave = false,
      sessions = {
        sessions_path = H.condMkdir(os.getenv("VICONFDIR"),"session/"),
        sessions_icon = '󰅏 '
      },
      save_hook = function() vim.cmd('call SaveColor()') end,
      post_hook = function() vim.cmd('call LoadColor()') end,
      fzf_winopts = { width=.5 }
    },
    init = function()
      local possession = require("nvim-possession")
      -- vim.keymap.set("n", ",pl", function() possession.list() end)
      -- vim.keymap.set("n", ",pn", function() possession.new() end)
      -- vim.keymap.set("n", ",po", function() possession.update() end)
      -- vim.keymap.set("n", ",pd", function() possession.delete() end)
    end,
  },

  'mizlan/iswap.nvim',
  -- 'lewis6991/satellite.nvim', --- add scrollbar
  -- 'Dax89/ide.nvim', -- maybe
  -- 'rktjmp/lush.nvim', --- for coloscheme making
  'marcuscaisey/olddirs.nvim', -- promising
  -- 'freddiehaddad/feline.nvim', -- on watch
  'CKolkey/ts-node-action',
  'Wansmer/sibling-swap.nvim',
  'smzm/hydrovim', --- eval python
  'luukvbaal/statuscol.nvim', -- ambitious
  'mrjones2014/legendary.nvim',
  'RaafatTurki/hex.nvim',
  'danielfalk/smart-open.nvim', --- funky telescope mode
  'tsakirist/telescope-lazy.nvim',
  -- 'chrisgrieser/nvim-various-textobjs',
  -- { 'AckslD/muren.nvim', config = true }, -- wow
  -- 'axkirillov/hbac.nvim', ]]
  -- 'rareitems/hl_match_area.nvim',
  'Eandrju/cellular-automaton.nvim',
  -- 'altermo/ultimate-autopair.nvim',
  -- 'nyngwang/murmur.lua', -- problem

  -- 'L3MON4D3/LuaSnip', -- problems
  -- 'saadparwaiz1/cmp_luasnip',



}
