
--------------------------------
--      Update Keymaps        --
--------------------------{{{}}}

vim.api.nvim_command('\
    nnoremap <silent> gh <cmd>ClangdSwitchSourceHeader<CR>|\
')

H.nmap('<C-h>', H.teles_ff)

H.nmap('z<Down>', function() vim.lsp.diagnostic.goto_next() end)
H.Bmap('z<Up>', "k<cmd>vim.lsp.diagnostic.goto_prev")
H.nmap(',S', vim.lsp.buf.signature_help)
vim.keymap.set('n','K', vim.lsp.buf.hover, {buffer=0})
-- H.nmap('gv', function() vim.api.nvim_open_win(true,true,{}) vim.lsp.buf.definition() end)
H.nmap('gv', function() vim.cmd('vsplit') vim.lsp.buf.definition() end)
-- vim.keymap.set('n', "gl", "<cmd>let bn=bufnr('%') <bar> let pos=getpos('.') <bar> wincmd p <bar> exec 'b' . bn <bar> call setpos('.',pos) <bar> lua vim.lsp.buf.definition()<CR>" )
H.nmap('gl', function() H.mirror_buf_to_prev_window() vim.lsp.buf.definition() end)
H.nmap('gs', vim.lsp.buf.document_symbol)
H.nmap('gr', vim.lsp.buf.references)
H.nmap('gw', vim.lsp.buf.workspace_symbol)
H.nmap('gy', vim.lsp.buf.type_definition)
H.nmap('gI', vim.lsp.buf.implementation)
H.nmap('z<down>', vim.diagnostic.goto_next)
H.nmap('z<up>', vim.diagnostic.goto_prev)
H.nmap(',R', vim.lsp.buf.rename)
H.nmap(',a', vim.lsp.buf.code_action)
H.nmap('gd', vim.lsp.buf.definition)
H.nmap('gD', vim.lsp.buf.declaration)

H.nmap('m;', ":BookmarksListAll<CR>")
-- H.nmap(',,q', function() b=require'nvim-possession'.update() print(1,b) if b then vim.cmd[[wqa]] end end )
H.nmap(',po', function() require'nvim-possession'.update() end )
H.nmap(',pl', function() require'nvim-possession'.list() end)
H.nmap(',pd', function() require'nvim-possession'.delete() end)
H.nmap(',pn', function() require'nvim-possession'.new() end)


H.nmap('qn', vim.diagnostic.open_float)
H.nmap('qb', vim.diagnostic.setloclist)

H.nmap(',"', function() require'nvim-peekup'.peekup_open('p') end )

-- Yank and put incremental
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

H.nmap(',n', ":Neotree reveal toggle<CR>")
-- H.nmap(',N', ":NeoTreeClose<CR>")
H.nmap(',<BS>', ":Neotree reveal_force_cwd<CR>")
H.nmap('-', ":Neotree reveal_force_cwd current<CR>")
H.nmap(',,b', ":IndentBlanklineToggle<CR>")
H.nmap('c<BS>', ":call ReloadStyle(1)<CR>")
H.nmap(',gr', ":call FocusBufOrDo('mylazy/init.lua','e $mylua/mylazy/init.lua')<CR>")
H.nmap(',gm', ":call FocusBufOrDo('mappings.lua','e $mylua/mappings.lua')<CR>")
-- H.nmap(',vp', function() vim.api.nvim_exec([[:put +| normal dfmxI'A',==]], false) end)
H.nmap(',vp', function() vim.api.nvim_exec([[:put +| normal 3df/^v$S}ysi}'A,==]], false) end)
H.nmap(',vt', function() require'tint'.toggle() end )
-- H.nmap(',vt', require'tint'.toggle)
H.nmap(',t', ":SymbolsOutline<CR>")
H.nmap(',j', require'treesj'.toggle)
-- vim.keymap.set('n', ',j', require('treesj').toggle)
-- H.nmap('q,', ":TSJJoin<CR>")
-- H.nmap('q.', ":TSJSplit<CR>")
H.nmap('d<', "<cmd>diffget //2<CR>")
H.nmap('d>', "<cmd>diffget //3<CR>")
H.nmap(',vn', function()  if vim.o.winbar=='' then vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}" else vim.o.winbar='' end end )

  -------- Finding -----------------------------{{{}}}------

local tele_ivy = require'telescope.themes'.get_ivy{ sort_mru = true, layout_config = { height = vim.opt.lines:get() - 10 } }
local tele_ivy_cwd = function()
    return require'telescope.themes'.get_ivy{ sort_mru = true, layout_config = { height = vim.opt.lines:get() - 10 }, cwd = require'telescope.utils'.buffer_dir() }
end
function Tele_buff_ivy() require("telescope.builtin").buffers( tele_ivy ) end
local tele_drop = require("telescope.themes").get_dropdown{ sort_mru=true, winblend=9, layout_config = { height=21 } }
function Tele_buff_drop() require("telescope.builtin").buffers( tele_drop ) end
H.nmap(',fb', Tele_buff_ivy, "Telescope [B]uffers ivy-themed")
H.nmap(',<space>', Tele_buff_drop)
H.nmap(',l', require("lsp_lines").toggle, "Toggle lsp_lines")
-- nnoremap ,<space> :Telescope buffers sort_mru=1 theme=dropdown winblend=9<CR>
H.nmap(',fh', require("telescope.builtin").help_tags, "Telescope [F]ind [H]elp_tags")
H.nmap(',fz', require("telescope.builtin").diagnostics, "Telescope [F]ind Diagnostics")
H.nmap(',fo', require("telescope.builtin").oldfiles, "Telescope [F]ind [O]ld files")
H.nmap(',fr', require("telescope.builtin").lsp_references, "Telescope [F]ind [R]eferences")
H.nmap(',f,', require'telescope.builtin'.git_files, "Telescope Git Files")
H.nmap('qf', "<cmd> call GetProjDir() <bar> exec 'Telescope find_files cwd=' . expand(b:proj_dir)<CR>", "[F]ind my text [F]iles")

H.nmap(
    ',/',
    function() require'telescope.builtin'.find_files({
        search_dirs={ os.getenv("loc"), os.getenv("sh"), os.getenv("tt") },
    }) end,
    "Find files in Favourite dirs"
)

H.nmap(
    ',fg',
    function()
        git_root = H.get_git_root()
        print("gr", git_root)
        if git_root then
            require'telescope.builtin'.find_files{ cwd=git_root }
            -- require'telescope.builtin'.find_files({ cwd="/mnt/d/proj/PITON" })
        else
            print(vim.api.nvim_buf_get_name(0) .. " has no git in path!")
        end
    end,
    "Find files in git root dir for current path"
)


-- H.nmap(',,/', ":Telescope find_files theme=ivy search_dirs=$sh,$PWD")
-- H.nmap(',,/', function() require'telescope.builtin'.find_files({ search_dirs={ os.getenv("sh"), os.getenv("tt"), vim.fn.getcwd() } }) end )
H.nmap(',fa', ":Telescope live_grep theme=ivy<CR>")
H.nmap(',fd', ":Telescope live_grep theme=ivy search_dirs=%<CR>")
H.nmap(',fd', function() require'telescope.builtin'.live_grep( tele_ivy_cwd() ) end)
H.nmap(',fc', ":Telescope current_buffer_fuzzy_find theme=ivy<CR>")
H.nmap(',ff', ":Telescope find_files theme=ivy<CR>")
H.nmap('qr',  ":Telescope lsp_references theme=ivy<CR>")
H.nmap(',fs', ":Telescope lsp_document_symbols<CR>")
H.nmap('qs',  ":Telescope lsp_dynamic_workspace_symbols<CR>")

H.nmap(',vg', require("gitsigns").toggle_signs, "Show git highlight column")
H.nmap('qt', ":HiMyWordsToggle<CR>")
H.nmap('qT', ":HiMyWordsClear<CR>")
H.nmap(',r', ":RnvimrToggle<CR>")
H.nmap(',<Esc>', ":Dashboard<CR>")

H.nvmap('qe', ":SnipRun<CR>", "Evaluate code")

H.nmap('s', ":HopAnywhere<CR>")
-- H.nmap(',vh', ":LocalHighlightToggle<CR>")
H.nmap(',vh', ":IlluminateToggle<CR>")

-- nnoremap ,tt :Telescope current_buffer_fuzzy_find sorting_strategy=ascending layout_config={"prompt_position":"top"}<CR>
-- nnoremap ,tt <cmd>lua require("telescope.builtin").current_buffer_fuzzy_find({sorting_strategy="ascending", theme="ivy"})<CR>

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
-- vim.keymap.set('n', keys, func, { desc = desc, noremap = true })

