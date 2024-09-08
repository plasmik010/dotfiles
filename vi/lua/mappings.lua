-- vim: ts=4 sw=4

---------- more mappings -----------------------{{{}}}------

vim.api.nvim_command('nnoremap <silent> gh <cmd>ClangdSwitchSourceHeader<CR>')

-- H.nmap('gv', function() vim.api.nvim_open_win(true,true,{}) vim.lsp.buf.definition() end)
H.nmap(
    'gv',
    function() vim.cmd('vsplit') vim.lsp.buf.definition() end,
    "lsp Definition in vert split"
)
-- vim.keymap.set('n', "gl", "<cmd>let bn=bufnr('%') <bar> let pos=getpos('.') <bar> wincmd p <bar> exec 'b' . bn <bar> call setpos('.',pos) <bar> lua vim.lsp.buf.definition()<CR>" )
H.nmap(
    'gl',
    function() H.mirror_buf_to_prev_window() vim.lsp.buf.definition() end,
    "lsp Definition in prev window"
)

H.nmap('gs', vim.lsp.buf.document_symbol)
H.nmap('gS', vim.lsp.buf.signature_help)
H.nmap('gr', vim.lsp.buf.references)
-- H.nmap('gw', vim.lsp.buf.workspace_symbol)
H.nmap('gy', vim.lsp.buf.type_definition, "lsp type definition")
H.nmap('gI', vim.lsp.buf.implementation, "lsp Implementation")
H.nmap(',k', vim.lsp.buf.hover, "Hover")

-- H.nmap('z<Down>', function() vim.lsp.diagnostic.goto_next() end)
-- H.Bmap('z<Up>', "k<cmd>vim.lsp.diagnostic.goto_prev")
do
    local next_diag, prev_diag
    -- if vim.version().build <= "gb7782daac" then
    if vim.version().minor <= 10 then
        next_diag = vim.diagnostic.goto_next
        prev_diag = vim.diagnostic.goto_prev
    else
        next_diag = {vim.diagnostic.jump, {count=1}}
        prev_diag = {vim.diagnostic.jump, {count=-1}}
    end
    H.nmap('z<Down>', next_diag )
    H.nmap('z<Up>', prev_diag)
end

-- H.nmap('z<up>', vim.diagnostic.goto_prev)
H.nmap(',R', vim.lsp.buf.rename, "LSP Rename")
H.nmap(',a', vim.lsp.buf.code_action, "LSP Action")
H.nmap('gd', vim.lsp.buf.definition)
H.nmap('gD', vim.lsp.buf.declaration)

H.nmap('m;', ":BookmarksListAll<CR>")


H.nmap(',,s', ":Telescope persisted<CR>", "Select Session")
-- H.nmap(',,q', function() b=require'nvim-possession'.update() print(1,b) if b then vim.cmd[[wqa]] end end )
-- H.nmap(',po', function() require'nvim-possession'.update() end, "Session Update")
-- H.nmap(',pl', function() require'nvim-possession'.list() end, "Session Open")
-- H.nmap(',pd', function() require'nvim-possession'.delete() end, "Session Delete")
-- H.nmap(',pn', function() require'nvim-possession'.new() end, "Session New")
-- H.nmap(',"', function() require'nvim-peekup'.peekup_open('p') end )


H.nmap('qn', vim.diagnostic.open_float)
H.nmap('qb', vim.diagnostic.setloclist)


-- Yank / put incremental
vim.keymap.set('n', 'q;', '<cmd>let @l=""|echo " L reg now empty" <CR>')
vim.keymap.set('n', 'qy', '\"Lyy<cmd>echo "added to L reg"<CR>')
vim.keymap.set('v', 'qy', '\"Ly<cmd>echo "added to L reg"<CR>')
vim.keymap.set('n', 'qd', '\"Ldd<cmd>echo "cut to L reg"<CR>')
vim.keymap.set('v', 'qd', '\"Ld<cmd>echo "cut to L reg"<CR>')
vim.keymap.set('n', 'qp', '\"lp')
vim.keymap.set('x', 'qp', '\"lp')

-- Move selection
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

H.Bmap('<C-PageUp>',   ":BufferLineCyclePrev<CR>", { silent = true })
H.Bmap('<C-PageDown>', ":BufferLineCycleNext<CR>", { silent = true })

H.nmap(',gg', ":call FocusBufOrDo('mylazy/init.lua','e $vi/lua/mylazy/init.lua')<CR>", "Plugins")
H.nmap(',gn', ":call FocusBufOrDo('lua/init.lua','e $vi/lua/init.lua')<CR>", "init.lua")
H.nmap(',gm', ":call FocusBufOrDo('mappings.lua','e $vi/lua/mappings.lua')<CR>", "Mappings")
H.nmap(
    ',vp',
    function() vim.api.nvim_exec2([[:put +| normal 3df/^v$S}ysi}'A,==]], {}) end,
    "Put plugin url as new entry"
)

H.nmap(',j', require'treesj'.toggle, "Tree Split/Join")
-- vim.keymap.set('n', ',j', require('treesj').toggle)
-- H.nmap('q,', ":TSJJoin<CR>")
-- H.nmap('q.', ":TSJSplit<CR>")
H.nmap('d<', "<cmd>diffget //2<CR>")
H.nmap('d>', "<cmd>diffget //3<CR>")
H.nmap(
    ',ve',
    function() if vim.o.winbar=='' then vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}" else vim.o.winbar='' end end,
    "Navic"
)

H.nmap(',r', ":RnvimrToggle<CR>", "Rnvimr")
H.nmap(',<TAB>', ":Dashboard<CR>", "Dashboard")
H.nmap(',v,', H.eval_paragraph, "Evaluate code for Neovim")

H.nmap(',co', "<cmd> Themery<CR>", "Themery")
H.nvmap('qe', ":SnipRun<CR>", "Evaluate code")

---------- Finding / Telescope -----------------{{{}}}------

H.nmap(
    '<C-h>',
    function ()
        local opt = require('telescope.themes').get_ivy{
            height=12,
            previewer=true,
            winblend=16,
        }
      require('telescope.builtin').current_buffer_fuzzy_find(opt)
    end,
    "Telescope current buffer fuzzy"
)

H.nmap(
    'q<space>',
    function()
        local ivy_theme = require'telescope.themes'.get_ivy {
            sort_mru=true,
            layout_config = { height=vim.opt.lines:get() - 10 },
            border = true,
        }
        require('telescope.builtin').buffers( ivy_theme )
    end,
    "Telescope Buffers ivy-themed"
)
H.nmap(
    ',<space>',
    function()
        local drop_theme = require'telescope.themes'.get_dropdown {
            sort_mru=true,
            winblend=9,
            layout_config = { height=14 },
            initial_mode = "normal",
        }
        require'telescope.builtin'.buffers(drop_theme)
    end,
    "desc"
)

H.nmap(',fh', require("telescope.builtin").help_tags, "Telescope help_tags")
H.nmap(',fz', require("telescope.builtin").diagnostics, "Telescope diagnostics")
H.nmap(',fo', require("telescope.builtin").oldfiles, "Telescope old files")
H.nmap(',fr', require("telescope.builtin").lsp_references, "Telescope References")

H.nmap(
    'qf',
    function()
        vim.cmd[[call GetProjDir()]]
        require'telescope.builtin'.find_files{
            cwd = vim.b["proj_dir"],
            hidden = true,
        }
    end,
    "Find cwd proj files"
)

H.nmap(
    'qc',
    function()
        require'telescope.builtin'.find_files{
            cwd = vim.fn.expand("%:p:h"),
            hidden = true,
        }
    end,
    "Find files in dir with current file"
)

H.nmap(
    ',/',
    function() require'telescope.builtin'.find_files {
        search_dirs = {
            "/ln/ho/bb",
            "/ln/gd/code_misc",
            os.getenv("loc"),
            os.getenv("dotfiles"),
            os.getenv("tt"),
        },
        follow = true,
    } end,
    "Find files in Favourite dirs"
)

H.nmap(
    ',f,',
    function()
        require'telescope.builtin'.git_files{ use_git_root=false }
    end,
    "Telescope Git Files in Current Path"
)
H.nmap(
    ',fg',
    function()
        local git_root = H.get_git_root()
        if git_root then
            require'telescope.builtin'.find_files{ cwd=git_root, hidden=true }
        else
            print(vim.api.nvim_buf_get_name(0) .. " has no git in path!")
        end
    end,
    "Telescope Files at git root level for current file"
)

H.nmap(',fa', ":Telescope live_grep theme=ivy<CR>", "Telescope live_grep")
H.nmap(
    ',fq',
    function()
        local function ivy_theme_arg(dir)
            return require'telescope.themes'.get_ivy {
                sort_mru = true,
                layout_config = { height = vim.opt.lines:get() - 10 },
                cwd = dir or require'telescope.utils'.buffer_dir(),
            }
        end
        require'telescope.builtin'.live_grep(ivy_theme_arg(H.get_git_root()))
    end,
    "Telescope live_grep git root"
)

H.nmap(',fc', ":Telescope current_buffer_fuzzy_find theme=ivy<CR>", "Telescope Current buffer")
H.nmap(',ff', ":Telescope find_files theme=ivy<CR>", "Telescope Find Files")
H.nmap('qr',  ":Telescope lsp_references theme=ivy<CR>")
H.nmap(',fs', ":Telescope lsp_document_symbols<CR>", "Telescope LSP file symbols")
H.nmap('qs',  ":Telescope lsp_dynamic_workspace_symbols<CR>", "Telescope dynamic symbols")

-------- Neotree -----------------------------{{{}}}------
H.nmap(
    ',N',
    function()
        local filedir = vim.fn.expand('%:p:h')
        vim.cmd.tcd(filedir)
        local reveal_file = vim.fn.expand('%:p')
        if (reveal_file == '') then
            reveal_file = vim.fn.getcwd()
        else
            local f = io.open(reveal_file, "r")
            if (f) then
                f.close(f)
            else
                reveal_file = vim.fn.getcwd()
            end
        end
        require('neo-tree.command').execute({
            -- action = "focus",          -- OPTIONAL, this is the default value
            source = "filesystem",     -- OPTIONAL, this is the default value
            position = "left",         -- OPTIONAL, this is the default value
            reveal_file = reveal_file, -- path to file or folder to reveal
            -- reveal_force_cwd = true,   -- change cwd without asking if needed
            toggle = true,
        })
    end,
    "Neotree at current file or working directory"
)

H.nmap(',n', ":Neotree reveal<CR>", "Neotree reveal ask")
H.nmap('-', ":Neotree reveal_force_cwd current<CR>", "Neotree current buffer")

---------- unloaded ----------------------------{{{}}}------

--[[ -- Cinnamon Keymaps --
if package.loaded['cinnamon'] then
  -- Half-window movements:
  vim.keymap.set({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
  vim.keymap.set({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")
  -- Page movements:
  vim.keymap.set({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
  vim.keymap.set({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
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
  -- Left/right movements:
  -- vim.keymap.set({ 'n', 'x' }, 'h', "<Cmd>lua Scroll('h', 0, 1)<CR>")
  -- vim.keymap.set({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")
  vim.keymap.set({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
  vim.keymap.set({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")
  vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")
  vim.keymap.set('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")
end ]]

-- vim.keymap.set('n', 'A-;', "<Cmd>exe Toggleterm<CR>")
-- nnoremap <silent><A-;> <Cmd>exe v:count1 . "ToggleTerm"<CR>
-- nnoremap <silent><A-;> <Cmd>exe "ToggleTerm"<CR>
-- tnoremap <silent><A-;> <C-\><C-n>:ToggleTermToggleAll<CR>
-- HINT -- vim.keymap.set('n', keys, func, { desc = desc, noremap = true })

