-- vim: ts=2 sw=2

-- MOST PLUGINS ARE INVOKED AND CONFIGURED ACCORDING TO THIS FILE --

local noresil = { noremap = true, silent = false }

return {

---------- VIM BASIC ---------------------------{{{}}}------

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
  'michaeljsmith/vim-indent-object', -- cool
  -- 'chrisbra/Colorizer', -- good
  -- 'godlygeek/tabular', -- okay
  -- 'junegunn/vim-easy-align', -- usable
  -- 'vim-scripts/QuickBuf',
  -- 'derekwyatt/vim-fswitch',

---------- NEOVIM ONLY -------------------------{{{}}}------

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        prompt_prefix = "$ ",
        mappings = {
          n = {
            ["h"] = "close",
            ["q"] = "close",
            ["l"] = "select_default",
          }
        }
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
          show_preview = false,
          previewer = false,
          layout_config = { width = 0.4, height = 0.6 }
        }
      },
      extensions = {
        persisted = {
          layout_config = { width = 0.55, height = 0.55 }
        },
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
      require'telescope'.load_extension('persisted')
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  'nvim-lua/plenary.nvim', --- library
  'powerman/vim-plugin-ruscmd', -- works

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          'c',
          'cpp',
          'lua',
          'python',
          'vim',
          'vimdoc',
          'bash',
          'markdown',
        },
        highlight = { enable = true },
        indent = { enable = false },
        -- indent = { enable = true, disable = { 'python' } },
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
            init_selection =    '<c-space>',
            node_incremental =  '<c-space>',
            node_decremental =  '<c-backspace>',
            scope_incremental = '<c-s>',
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
    enabled = false,
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
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      -- 'gennaro-tedesco/nvim-possession',
    },
    -- lazy = true,
    -- priority = 40,
    opts = {
      sections = {
        -- lualine_c = { "buffers" },
        lualine_c = {
          {
            -- icon = " 󰾹 ",
            icon = " ",
            padding = 2,
            'filename',
          --   color = function(section)
          --      return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
          --   end,
            -- color = { fg = 204 },
            -- color = nil,
            -- color = { gui='bold' },
            -- color = 'WarningMsg',
            color = 'ModeMsg',
            -- path = false,
            -- color_correction = 'dynamic',
            -- "navic",
            -- navic_opts = nil
          },
        }
      },
      inactive_sections = {
        -- lualine_a = { },
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'progress'},
        lualine_y = {'location'},
      },
      options = {
        -- section_separators = '',
        section_separators = { left = '', right = '' },
        component_separators = '',
        disabled_filetypes = {     -- Filetypes to disable lualine for.
          statusline = { 'dashboard' },       -- only ignores the ft for statusline.
        },
        theme = 'auto',
        -- theme = 'nord',
        -- theme = 'everforest',
        -- theme = 'bluloco-dark',
      },
    },
  },

  {
    'akinsho/bufferline.nvim',
    version='*',
    dependencies='kyazdani42/nvim-web-devicons',
    opts = {
      highlights = {
        tab = {
          -- fg = 235,
          -- bg = 200,
          bold = true,
        },
      },
      options = {
        show_tab_indicators = true,
        separator_style = "slope",
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        }
      }
    }
    -- edit in /bufferline.nvim/lua/bufferline/config.lua
    -- tab_selected = {
    --   fg = normal_fg,
    --   bg = normal_bg,
  },

  {
    'windwp/nvim-autopairs',
    enabled = false,
    config = function()
      local pl = require'nvim-autopairs'
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

  {
    'folke/which-key.nvim', -- good/problem --- display key mappings interactively
    -- lazy = false,
    -- priority = 1000,
    opts = {
      preset = "modern",
      plugins = {
        marks = false,
      },
      triggers = {
      --   { ",", mode = {"n","v"} },
      --   { "<Leader>", mode = {"n","v"} },
      --   { "<auto>", mode = "nxso" },
        { "<auto>", mode = "nxsotc" },
      }
    }
  },

  'norcalli/nvim-colorizer.lua', --- highlight color codes

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim', -- cool --- multiline lsp hints
    config = function()
      -- turn it off on start
      require'lsp_lines'.toggle()
      require'lsp_lines'.toggle()
      require'lsp_lines'.setup()
      -- Disable virtual_text since it's redundant due to lsp_lines.
      vim.diagnostic.config({virtual_text = false})
      H.nmap(',l', require("lsp_lines").toggle, "Toggle lsp_lines")
    end,
    -- keys = ",l",
  },


  {
    'folke/trouble.nvim',
    config = true
  },

  {
    'andrewferrier/debugprint.nvim', -- handy! --- auto insert logging lines
    config = true,
    opts = {
      keymaps = {
        normal = {
          plain_below = "zp",
          plain_above = "zP",
        }
      }
    }
  },

  'LukasPietzschmann/telescope-tabs', -- usable

  {
    'ziontee113/syntax-tree-surfer', --- move with TS
    config = function()
      require'syntax-tree-surfer'.setup()
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
        forward = "<A-Down>",
        backward = "<A-Up>",
        on_success = nil
      }
    end
  },

  'sindrets/diffview.nvim', -- great --- cycle through diffs
  -- check :DiffviewOpen -- use it to MERGE CONFLICT

  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      local hop = require'hop'
      hop.setup { keys = 'etovxqpdygfblzhckisuran' }
      local directions = require('hop.hint').HintDirection
      H.nmap('s', ":HopWord<CR>")
      -- vim.keymap.set('n', 'f', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true }) end, {remap=true})
      -- vim.keymap.set('n', 'F', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true }) end, {remap=true})
      -- vim.keymap.set('n', 't', function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, {remap=true})
      -- vim.keymap.set('n', 'T', function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, {remap=true})
    end,
  },

  {
    'simrat39/symbols-outline.nvim', -- okay --- symbols tree based on lsp
    -- config = true
    config = function()
      require'symbols-outline'.setup({})
      H.nmap('g<BS>', "<cmd>SymbolsOutline<CR>", "Tree-like view for symbols")
    end
  },

  'gennaro-tedesco/nvim-peekup', -- so-so --- clipboard history,  usage:""

  {
    'trmckay/based.nvim', --- decode hex and octal to decimal
    enabled = false,
    config = function()
      H.nmap(',cb', require'based'.convert)
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
    configure = true,
    init = function()
      -- local tint = require("tint")
      --   tint.setup()
      -- tint.disable()
      require'tint'.disable()
      H.nmap(',vw', require'tint'.toggle, "Tint Focused window")
    end
  },

  -- { 'echasnovski/mini.splitjoin', version = '*' },

  {
    'echasnovski/mini.files', -- very handy --- mini FM
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
      H.nmap(",h", function() MiniFiles.open(vim.api.nvim_buf_get_name(0), "mini.files") end) -- open at current file
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
    enabled = false,
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
    'petertriho/nvim-scrollbar', -- okay
    config = function()
      require("scrollbar").setup()
      H.nmap(',vs', ":ScrollbarToggle<CR>", "Toggle Scrollbar")
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
      H.nmap(',vm', require'codewindow'.toggle_minimap, "Toggle side Map")
    end
  },

  'nullchilly/fsread.nvim', -- funky --- read fast

  {
    'epwalsh/obsidian.nvim',
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        { name = "common", path = "$HOME/proj/obsidiankeep" },
        -- { name = "work", path = "~/vaults/work" },
      },
    },
  },


---------- Tryout ------------------------------{{{}}}------

-- https://github.com/stevearc/overseer.nvim

  {
      "ziontee113/icon-picker.nvim", --- pick Nerd Font symbol
      opts = { disable_legacy_commands = true }
          -- vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
          -- vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
          -- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
  },

  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- {
  --   "gennaro-tedesco/nvim-possession", -- works
  --   dependencies = { "ibhagwan/fzf-lua" },
  --   enabled = false,
  --   config = true,
  --   opts = {
  --     autosave = false,
  --     sessions = {
  --       sessions_path = H.condMkdir(os.getenv("HOME"),".nvim-session/session/"),
  --       sessions_icon = '󰅏 '
  --     },
  --     save_hook = function() vim.cmd('call SaveColor()') end,
  --     post_hook = function() vim.cmd('call LoadColor()') end,
  --     fzf_winopts = { width=.5 }
  --   },
  --   init = function()
  --     -- vim.keymap.set("n", ",pl", function() possession.list() end)
  --     -- vim.keymap.set("n", ",pn", function() possession.new() end)
  --     -- vim.keymap.set("n", ",po", function() possession.update() end)
  --     -- vim.keymap.set("n", ",pd", function() possession.delete() end)
  --   end,
  -- },

  {
    'olimorris/persisted.nvim',
    -- lazy = false,
    config = true,
  },

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
    'junegunn/vim-easy-align', -- good
    config = function()
      -- H.nmap('ga', '<Plug>(EasyAlign)')
      vim.keymap.set('n', 'al',  '<Plug>(EasyAlign)')
      vim.keymap.set('x', 'al',  '<Plug>(EasyAlign)')
    end
  },

  {
    'michaelb/sniprun', -- maybe --- REPL
    build = 'sh ./install.sh',
    enabled = false,
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

  -- 'cbochs/portal.nvim', -- problem
  'princejoogie/dir-telescope.nvim',
  'pocco81/true-zen.nvim',

  {
    'rbong/vim-flog', --- provides git graph
    dependencies = 'tpope/vim-fugitive',
  },

  {
    'NeogitOrg/neogit', --- mighty
    enabled = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },

  {
    'lewis6991/gitsigns.nvim', -- cool --- edits highlight and more..
    config = function()
      local gs = require'gitsigns'
      gs.setup()
      gs.toggle_signs(false) -- switch off on start
      require("scrollbar.handlers.gitsigns").setup() -- take it to scrollbar
      H.nmap(',vg', gs.toggle_signs, "Show git highlight column")
    -- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    -- map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
      H.nmap('g<Up>', function() gs.nav_hunk('prev') end, "Prev Git hunk")
      H.nmap('g<Down>', function() gs.nav_hunk('next') end, "Next Git hunk")
      H.nmap(',,g', ":Gitsigns change_base ~1", "Highlight older commits")
    end,
  },

  {
    'folke/flash.nvim', -- problem
    enabled = false,
    config = 'require("flash").setup()'
  },

  {
    "MaximilianLloyd/lazy-reload.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      { ",,r", "<cmd>lua require('lazy-reload').feed()<cr>", desc = "Reload a plugin" },
    }
  },

  {
    'echasnovski/mini.cursorword',
    version = '*',
    enabled = false,
    opts = {
      delay = 320,
    }
  },

  {
    'RRethy/vim-illuminate', --- highlight current word
    enabled = true,
    config = function()
      require'illuminate'.configure {
        providers = {
          -- 'lsp',
          -- 'treesitter',
          'regex',
        },
        delay = 620,
      }
      vim.cmd[[IlluminatePause]]
      -- H.nmap(',vh', ":IlluminateToggle<CR>", "Highlight current word")
      H.nmap(
        ',vh',
        function()
          H.highlit_cur = not H.highlit_cur
          if H.highlit_cur then
            vim.cmd[[IlluminateResume]]
          else
            vim.cmd[[IlluminatePause]]
          end
        end,
        "Toggle Highlight current word"
      )
    end,
  },

  {
    'dvoytik/hi-my-words.nvim', --- highlight words you wish
    config = function()
      require'hi-my-words'.setup()
      H.nmap('qt', ":HiMyWordsToggle<CR>")
      H.nmap('qT', ":HiMyWordsClear<CR>")
    end
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
      replace_netrw = false,
      sync_cwd = true,
      show_hidden = false,
    },
    init = function()
      vim.keymap.set('n', '_', require'nvim-traveller'.open_navigation)
      -- H.nmap('_', require'nvim-traveller'.open_navigation)
      -- Opens quick directory search (Tab to display all directories)
      -- vim.keymap.set('n', ',d', require'nvim-traveller'.last_directories_search)
      -- vim.keymap.set('n', ',o', require'nvim-traveller'.open_terminal)
    end,
  },

  {
    'tzachar/highlight-undo.nvim', -- not working with v0.10.1
    configure = true,
    opts = {
      duration = 900,
    }
  },

  { 'prochri/telescope-all-recent.nvim', dependencies = {'kkharji/sqlite.lua'} },

  {
    'AckslD/nvim-neoclip.lua', -- problem
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = true,
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
    -- try -- https://github.com/MiaadTeam/lesvim/blob/main/lua/lazy/settings/alpha.lua
    config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },

  -- {
  --   'zaldih/themery.nvim', -- great --- colorscheme selector
  --   cmd = "Themery",
  --   config = function()
  --     local themelist = vim.api.nvim_eval("getcompletion('','color')")
  --     -- print(vim.inspect(opts.themes))
  --     require'themery'.setup { themes = themelist, }
  --   end
  -- },

  'mrjones2014/legendary.nvim',
  'mizlan/iswap.nvim',
  -- 'lewis6991/satellite.nvim', --- add scrollbar
  -- 'Dax89/ide.nvim', -- maybe
  -- 'rktjmp/lush.nvim', --- for coloscheme making
  'marcuscaisey/olddirs.nvim', -- promising
  -- 'freddiehaddad/feline.nvim', -- on watch
  'CKolkey/ts-node-action',
  'Wansmer/sibling-swap.nvim',
  -- 'smzm/hydrovim', --- eval python
  'luukvbaal/statuscol.nvim', -- ambitious
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


---------- Colors/Themes -----------------------{{{}}}------

  'AbdelrahmanDwedar/awesome-nvim-colorschemes',
  'gbprod/nord.nvim',

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour="macchiato",
      transparent_background=true,
    }
  },

  { "2nthony/vitesse.nvim", dependencies = { "tjdevries/colorbuddy.nvim" }, }, -- foresty
  { 'AlexvZyl/nordic.nvim', lazy = false, priority = 1000 }, -- beautiful
  { 'folke/tokyonight.nvim', branch = 'main' },
  { 'sonph/onehalf', config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end }, -- Nice good tone HUGE

  'glepnir/porcelain.nvim',
  'haystackandroid/carbonized',
  'antonk52/lake.nvim',
  'xero/miasma.nvim',
  'nvimdev/oceanic-material',
  'maxmx03/FluoroMachine.nvim', -- neeooooon
  'felipeagc/fleet-theme-nvim',

  {
    'uloco/bluloco.nvim',
    dependencies={'rktjmp/lush.nvim'},
    opts = {
      style = "light",               -- "auto" | "dark" | "light"
      transparent = true,
      italics = false,
      terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default
      guicursor   = true,
    }
  }, -- have transprent

  '2nthony/vitesse.nvim',
  'JoosepAlviste/palenightfall.nvim',
  'Yazeed1s/oh-lucy.nvim',
  'kvrohit/mellow.nvim',
  'sam4llis/nvim-tundra', -- needs lua require()
  'katawful/kat.nvim',
  'Tsuzat/NeoSolarized.nvim',
  'rebelot/kanagawa.nvim',
  'lukas-reineke/onedark.nvim',
  'projekt0n/github-nvim-theme',
  -- 'AstroNvim/astrotheme', -- problems
  'savq/melange-nvim',
  'Yazeed1s/minimal.nvim',

  -- 'morhetz/gruvbox', -- best
  'sainnhe/gruvbox-material', -- improved
  '010penetrator/vim-colors-forplasma', -- collection
  'chriskempson/vim-tomorrow-theme', -- Nice dark+light
  'w0ng/vim-hybrid', -- beautiful
  'kristijanhusak/vim-hybrid-material', -- nice Sane dark
  'severij/vadelma', -- white good-con
  'https://gitlab.com/protesilaos/tempus-themes-vim.git',
  'cocopon/iceberg.vim', -- soft cold dark
  'AlessandroYorba/Alduin', -- brown lowcon
  'jonathanfilip/vim-lucius', -- day morning
  'rose-pine/neovim', -- fancy dark
  'romainl/Apprentice', -- nostrain
  'JarrodCTaylor/spartan', -- 'spartan,immortals
  'pbrisbin/vim-colors-off',
  'bf4/vim-dark_eyes', -- NIGHT
  'vim-scripts/C64.vim', -- joke
  'szorfein/fantasy.vim', -- dull
  'KimNorgaard/vim-frign', -- borland_style
  'KKPMW/sacredforest-vim', -- lowcont
  'logico-dev/typewriter', -- good!
  'beigebrucewayne/min_solo', -- grey bg subtle__
  'lithammer/vim-eighties', -- trueeeee
  'arzg/vim-substrata', -- cold neon
  'sainnhe/edge', -- good soft
  'sainnhe/everforest', -- cream lowcon
  'sainnhe/archived-colors', -- atlantis,cryslominsa,desert_night,fairy_garden,grimoire,ice_age,lost_shrine,vanilla_cake
  'flrnd/plastic.vim', -- solid dark
  'EdenEast/nightfox.nvim', -- fashy dark
  'colepeters/spacemacs-theme.vim', -- cool
  'relastle/bluewery.vim', -- low-con
  'stillwwater/vim-nebula', -- cold dark
  'franbach/miramare', -- coffee dark
  'mhartington/oceanic-next', -- soft nice
  'vim-scripts/Spacegray.vim', -- darker
  'nanotech/jellybeans.vim', -- good4html
  'HenryNewcomer/vim-theme-underflow', -- consbroken
  'jacoborus/tender.vim', -- sane soft dark
  'AlessandroYorba/Sierra', -- softgray
  'AlessandroYorba/Despacio', -- softdarkgrey
  'dracula/vim', -- funky
  -- 'dfrunza/vim', -- borland,muratori,pencil,vc6
  'jlund3/colorschemer', -- semibroken 'lucid
  'srcery-colors/srcery-vim', -- fresh-dark consbroken HUGE
  'zefei/cake16', -- cool medium
  'machakann/vim-colorscheme-tatami', -- fun green
  -- 'jakwings/vim-colors', -- 'moody,garden,messy  404
  -- 'RussellBradley/vim-knicks', -- great blue  404
  -- 'aradunovic/perun.vim', -- consbroken  404
  -- 'the31k/vim-colors-tayra', -- Nice gray  404
  'koirand/tokyo-metro.vim', -- pretty dark
  'nightsense/rusticated', -- morning
  'ajmwagar/vim-dues', -- soft coffee 'deus
  'nightsense/snow', -- soft)
  'nightsense/stellarized', -- nice! light+dark
  'arzg/vim-mayanfog', -- light bone
  'arzg/vim-plan9', -- trueeeee

  ---- Pretty but not useful -------------------------------
  -- 'beigebrucewayne/Turtles', -- funky
  -- 'sainnhe/sonokai', -- dark gui&nogui
  -- 'szorfein/fromthehell.vim', -- dark satur earth
  -- 'whatyouhide/vim-gotham', -- neon/green
  -- 'yuttie/inkstained-vim', -- very low con light
  'ayu-theme/ayu-vim',
  -- 'atelierbram/vim-colors_atelier-schemes', -- mindfuck
  -- 'bcicen/vim-vice', -- joke
  -- 'vim-scripts/swamplight', -- day

}
