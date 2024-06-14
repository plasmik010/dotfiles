
let s:term_red = 124
let s:term_green = 78
let s:term_yellow = 180
let s:term_blue = 32
let s:term_purple = 135
let s:term_white = 145
let s:term_paper = 229
let s:term_black = 235
let s:term_blacke = 234
let s:term_blacker = 233
let s:term_grey = 236
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ '#292c33', '#98c379', s:term_black, s:term_green, 'bold' ], [ '#98c379', '#292c33', s:term_green, s:term_black ] ]
let s:p.normal.right = [ [ '#292c33', '#98c379', s:term_white, s:term_black ], [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ], [ '#f8c379', '#f92c33', s:term_green, s:term_black ] ]
let s:p.inactive.right = [ [ '#292c33', '#61afef', s:term_white, s:term_black], [ '#abb2bf', '#3e4452', s:term_paper, s:term_grey ] ]
" let s:p.inactive.left = s:p.inactive.right[1:]
let s:p.inactive.left = [ [ s:term_paper, s:term_blacke ] ]
let s:p.insert.left = [ [ '#292c33', '#61afef', s:term_black, s:term_yellow, 'bold' ], [ '#61afef', '#292c33', s:term_yellow, s:term_black ] ]
let s:p.insert.right = [ s:p.normal.right[0], s:p.normal.right[1], [ '#61afef', '#292c33', s:term_yellow, s:term_black ] ]
let s:p.replace.left = [ [ '#111111', '#E11527', 'bold' ], [ '#e06c75', '#292c33', s:term_yellow, s:term_black ] ]
let s:p.replace.right = [ s:p.normal.right[0], s:p.normal.right[1], [ '#e06c75', '#292c33', s:term_yellow, s:term_black ] ]
let s:p.visual.left = [ [ '#292c33', '#c678dd', s:term_black, s:term_purple, 'bold' ], [ '#c678dd', '#292c33', s:term_purple, s:term_black ] ]
let s:p.visual.right = [ s:p.normal.right[0], s:p.normal.right[1], [ '#c678dd', '#292c33', s:term_purple, s:term_black ] ]
let s:p.normal.middle = [ [ '#abb2bf', '#292c33', s:term_white, s:term_black ] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.replace.middle = s:p.normal.middle
let s:p.tabline.left = [ s:p.normal.left[1] ]
let s:p.tabline.tabsel = [ s:p.normal.left[0] ]
let s:p.tabline.middle = s:p.normal.middle
let s:p.tabline.right = [ s:p.normal.left[1] ]
let s:p.normal.error = [ [ '#292c33', '#e06c75', s:term_black, s:term_red ] ]
let s:p.normal.warning = [ [ '#292c33', '#e5c07b', s:term_black, s:term_yellow ] ]
let g:lightline#colorscheme#deus#palette = lightline#colorscheme#fill(s:p)

highlight Define guifg=#55365e
highlight LightlineRight_terminal_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_insert_0 guibg=#72ad63 guifg=#e7e5e5
highlight LightlineLeft_insert_1 guibg=#dedcdc guifg=#72ad63
highlight PmenuSel guibg=#b1aaaa guifg=#202622
highlight rubyAttribute guifg=#345773
highlight Search guibg=#734d06 guifg=#e1dfdf
highlight LightlineLeft_terminal_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_replace_0_1 guibg=#dedcdc guifg=#790000
highlight LightlineRight_replace_1_2 guibg=#dedcdc guifg=#dedcdc
highlight ErrorMsg guibg=#fc0000 guifg=#000000
highlight TabLine guibg=#e1dfdf guifg=#202622
highlight LightlineLeft_insert_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_visual_0_tabsel guibg=#396b91 guifg=#734400
highlight LightlineMiddle_insert guibg=#dedcdc guifg=#283544
highlight LightlineRight_command_2_3 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_insert_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineLeft_terminal_1 guibg=#dedcdc guifg=#72ad63
highlight LightlineRight_select_2_3 guibg=#dedcdc guifg=#dedcdc
highlight rubyStringDelimiter guifg=#899137
highlight NonText guifg=#b1aaaa
highlight LightlineRight_terminal_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_command_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_command_0_1 guibg=#dedcdc guifg=#704a85
highlight Repeat guifg=#202622
highlight LightlineLeft_tabline_0_1 guibg=#dedcdc guifg=#dedcdc
highlight StatusLineNC guibg=#202622 guifg=#a9a3a3
highlight LightlineRight_insert_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_normal_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_visual_0_1 guibg=#dedcdc guifg=#734400
highlight htmlTag guifg=#902828
highlight LineNr guifg=#b1aaaa
highlight rubySymbol guifg=#899137
highlight rubyLocalVariableOrMethod guifg=#934917
highlight LightlineLeft_terminal_0_tabsel guibg=#396b91 guifg=#72ad63
highlight LightlineLeft_insert_tabsel guibg=#396b91 guifg=#e7e5e5
highlight goConstants guifg=#734d06
highlight NvimInternalError guibg=#fc0000 guifg=#fc0000
highlight LightlineLeft_replace_0_tabsel guibg=#396b91 guifg=#790000
highlight LightlineRight_normal_0_tabsel guibg=#396b91 guifg=#704a85
highlight LightlineRight_replace_2_3 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_command_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_terminal_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineLeft_terminal_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_inactive_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight Function guifg=#345773
highlight LightlineRight_visual_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight WarningMsg guifg=#902828
highlight LightlineRight_tabline_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight Visual guibg=#b1aaaa
highlight LightlineRight_replace_0_tabsel guibg=#396b91 guifg=#790000
highlight LightlineRight_command_tabsel_0 guibg=#704a85 guifg=#396b91
highlight LightlineRight_command_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight Todo guibg=#e1dfdf guifg=#5a635a
highlight LightlineRight_replace_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight DiagnosticError guifg=#fc0000
highlight LightlineRight_normal_tabsel_0 guibg=#704a85 guifg=#396b91
highlight LightlineLeft_command_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight rubyConstant guifg=#734d06
highlight Structure guifg=#55365e
highlight LightlineRight_replace_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight pythonRepeat guifg=#55365e
highlight vimCommand guifg=#902828
highlight LightlineRight_replace_tabsel_0 guibg=#790000 guifg=#396b91
highlight LightlineRight_replace_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight DiagnosticWarn guifg=#fc9e00
highlight LightlineRight_tabline_tabsel_0 guibg=#396b91 guifg=#396b91
highlight LightlineLeft_insert_0_1 guibg=#dedcdc guifg=#72ad63
highlight Normal guibg=#e1dfdf guifg=#202622
highlight LightlineRight_insert_0 guibg=#72ad63 guifg=#e7e5e5
highlight LightlineRight_insert_1 guibg=#dedcdc guifg=#72ad63
highlight LightlineRight_insert_2 guibg=#dedcdc guifg=#283544
highlight LightlineRight_inactive_0 guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_select_0_1 guibg=#dedcdc guifg=#734400
highlight LightlineRight_inactive_1 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_command_0 guibg=#704a85 guifg=#e7e5e5
highlight LightlineLeft_command_1 guibg=#dedcdc guifg=#704a85
highlight LightlineLeft_command_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineMiddle_replace guibg=#dedcdc guifg=#283544
highlight LightlineMiddle_terminal guibg=#dedcdc guifg=#283544
highlight PreProc guifg=#55365e
highlight LightlineLeft_inactive_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_visual_0_tabsel guibg=#396b91 guifg=#734400
highlight LightlineLeft_replace_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight Folded guibg=#e1dfdf guifg=#5a635a
highlight LightlineLeft_tabline_0_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineLeft_select_tabsel_0 guibg=#734400 guifg=#396b91
highlight LightlineLeft_select_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight Directory guifg=#345773
highlight LightlineRight_replace_tabsel guibg=#396b91 guifg=#e7e5e5
highlight Title guifg=#5a635a
highlight LightlineRight_command_0_tabsel guibg=#396b91 guifg=#704a85
highlight LightlineLeft_select_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_terminal_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineLeft_insert_tabsel_0 guibg=#72ad63 guifg=#396b91
highlight LightlineRight_visual_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_visual_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_replace_tabsel_0 guibg=#790000 guifg=#396b91
highlight LightlineLeft_replace_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_replace_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight Question guifg=#899137
highlight LightlineRight_terminal_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_visual_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineLeft_command_0_1 guibg=#dedcdc guifg=#704a85
highlight LightlineLeft_tabline_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight phpKeyword guifg=#55365e
highlight LightlineRight_visual_tabsel guibg=#396b91 guifg=#e7e5e5
highlight rubyInterpolationDelimiter guifg=#934917
highlight LightlineLeft_normal_0_1 guibg=#dedcdc guifg=#704a85
highlight LightlineLeft_replace_0_1 guibg=#dedcdc guifg=#790000
highlight Type guifg=#345773
highlight LightlineLeft_terminal_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_select_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_command_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight VertSplit guibg=#a9a3a3 guifg=#a9a3a3
highlight LightlineRight_inactive_0_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_normal_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_normal_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight Conceal guibg=#4b4545 guifg=#141212
highlight LightlineLeft_replace_0 guibg=#790000 guifg=#e7e5e5
highlight Underlined guifg=#00165b
highlight LightlineLeft_insert_0_tabsel guibg=#396b91 guifg=#72ad63
highlight LightlineLeft_terminal_0 guibg=#72ad63 guifg=#e7e5e5
highlight diffAdded guifg=#899137
highlight LightlineRight_insert_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineLeft_command_1_2 guibg=#dedcdc guifg=#dedcdc
highlight ColorColumn guibg=#d5d2d2
highlight LightlineLeft_tabline_0 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_replace_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_visual_2_3 guibg=#dedcdc guifg=#dedcdc
highlight RedrawDebugComposed guibg=#9cfc9c
highlight LightlineRight_visual_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight htmlScriptTag guifg=#902828
highlight LightlineLeft_select_0 guibg=#734400 guifg=#e7e5e5
highlight LightlineRight_visual_0 guibg=#734400 guifg=#e7e5e5
highlight coffeeConditional guifg=#55365e
highlight LightlineLeft_select_0_tabsel guibg=#396b91 guifg=#734400
highlight LightlineRight_normal_2_3 guibg=#dedcdc guifg=#dedcdc
highlight LightlineMiddle_select guibg=#dedcdc guifg=#283544
highlight cConditional guifg=#55365e
highlight Statement guifg=#202622
highlight javaScriptBraces guifg=#202622
highlight DiffAdd guibg=#b0b7c0 guifg=#899137
highlight ShowMarksHLl guibg=#e1dfdf guifg=#934917
highlight ShowMarksHLm guibg=#e1dfdf guifg=#346961
highlight LightlineLeft_normal_0 guibg=#704a85 guifg=#e7e5e5
highlight LightlineLeft_normal_1 guibg=#dedcdc guifg=#704a85
highlight LightlineLeft_select_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineLeft_normal_1_2 guibg=#dedcdc guifg=#dedcdc
highlight phpStatement guifg=#55365e
highlight DiffText guibg=#934917 guifg=#b0b7c0
highlight LightlineLeft_visual_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineLeft_replace_1 guibg=#dedcdc guifg=#790000
highlight LightlineRight_terminal_tabsel guibg=#396b91 guifg=#e7e5e5
highlight Conditional guifg=#202622
highlight LightlineLeft_select_1 guibg=#dedcdc guifg=#734400
highlight LightlineRight_visual_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_insert_0_tabsel guibg=#396b91 guifg=#72ad63
highlight LightlineLeft_command_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_select_0 guibg=#734400 guifg=#e7e5e5
highlight LightlineRight_select_2 guibg=#dedcdc guifg=#283544
highlight LightlineRight_visual_1 guibg=#dedcdc guifg=#734400
highlight LightlineRight_replace_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight DiffChange guibg=#b0b7c0 guifg=#734d06
highlight LightlineRight_terminal_2_3 guibg=#dedcdc guifg=#dedcdc
highlight LightlineLeft_inactive_tabsel_0 guibg=#396b91 guifg=#396b91
highlight LightlineRight_select_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight ShowMarksHLo guibg=#e1dfdf guifg=#55365e
highlight LightlineLeft_replace_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineLeft_normal_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineLeft_select_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_insert_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight phpVarSelector guifg=#902828
highlight LightlineMiddle_tabline guibg=#dedcdc guifg=#396b91
highlight LightlineRight_select_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_replace_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight goConditional guifg=#55365e
highlight LightlineLeft_command_tabsel_0 guibg=#704a85 guifg=#396b91
highlight LightlineLeft_command_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_inactive_tabsel guibg=#396b91 guifg=#e7e5e5
highlight rubyInclude guifg=#345773
highlight LightlineRight_insert_2_3 guibg=#dedcdc guifg=#dedcdc
highlight javaScriptFunction guifg=#55365e
highlight MatchParen guibg=#b1aaaa
highlight pythonConditional guifg=#55365e
highlight LightlineRight_insert_0_1 guibg=#dedcdc guifg=#72ad63
highlight LightlineRight_normal_0_1 guibg=#dedcdc guifg=#704a85
highlight LightlineRight_terminal_0_tabsel guibg=#396b91 guifg=#72ad63
highlight LightlineLeft_terminal_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight RedrawDebugClear guibg=#fbfc00
highlight LightlineLeft_terminal_tabsel_0 guibg=#72ad63 guifg=#396b91
highlight rubyCurlyBlock guifg=#934917
highlight LightlineLeft_terminal_0_1 guibg=#dedcdc guifg=#72ad63
highlight LightlineRight_normal_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight phpRepeat guifg=#55365e
highlight Identifier guifg=#902828
highlight LightlineRight_select_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_command_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_select_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineRight_terminal_tabsel_0 guibg=#72ad63 guifg=#396b91
highlight goRepeat guifg=#55365e
highlight LightlineRight_normal_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight Operator guifg=#346961
highlight ModeMsg guifg=#899137
highlight LightlineLeft_terminal_tabsel guibg=#396b91 guifg=#e7e5e5
highlight rubyConditional guifg=#55365e
highlight PmenuSbar guibg=#807676
highlight goStatement guifg=#55365e
highlight javaScriptConditional guifg=#55365e
highlight LightlineLeft_tabline_tabsel guibg=#396b91 guifg=#e7e5e5
highlight javaScriptMember guifg=#934917
highlight LightlineLeft_command_0_tabsel guibg=#396b91 guifg=#704a85
highlight LightlineLeft_insert_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight String guifg=#899137
highlight LightlineRight_command_0 guibg=#704a85 guifg=#e7e5e5
highlight LightlineRight_command_1 guibg=#dedcdc guifg=#704a85
highlight LightlineRight_command_2 guibg=#dedcdc guifg=#283544
highlight LightlineLeft_inactive_0_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_terminal_0 guibg=#72ad63 guifg=#e7e5e5
highlight LightlineRight_terminal_1 guibg=#dedcdc guifg=#72ad63
highlight Constant guifg=#934917
highlight LightlineRight_normal_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_normal_0 guibg=#704a85 guifg=#e7e5e5
highlight LightlineRight_normal_1 guibg=#dedcdc guifg=#704a85
highlight LightlineRight_normal_2 guibg=#dedcdc guifg=#283544
highlight DiffDelete guibg=#b0b7c0 guifg=#902828
highlight LightlineLeft_select_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight Include guifg=#345773
highlight CursorLineNr guifg=#fbfc00
highlight LightlineLeft_visual_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_normal_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight Pmenu guibg=#b1aaaa guifg=#202622
highlight LightlineLeft_normal_0_tabsel guibg=#396b91 guifg=#704a85
highlight LightlineLeft_normal_tabsel guibg=#396b91 guifg=#e7e5e5
highlight Error guibg=#fc0000 guifg=#000000
highlight LightlineLeft_visual_tabsel_0 guibg=#734400 guifg=#396b91
highlight LightlineLeft_visual_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_visual_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_select_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight javaScriptRepeat guifg=#55365e
highlight LightlineRight_terminal_2 guibg=#dedcdc guifg=#283544
highlight LightlineRight_insert_tabsel_0 guibg=#72ad63 guifg=#396b91
highlight LightlineRight_insert_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_insert_tabsel_3 guibg=#dedcdc guifg=#396b91
highlight goDeclaration guifg=#345773
highlight Comment guifg=#5a635a
highlight cType guifg=#734d06
highlight Ignore guifg=#e1dfdf
highlight FoldColumn guibg=#e1dfdf guifg=#00fbfc
highlight LightlineLeft_command_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_terminal_1_2 guibg=#dedcdc guifg=#dedcdc
highlight javaScriptNumber guifg=#934917
highlight LightlineMiddle_command guibg=#dedcdc guifg=#283544
highlight LightlineLeft_normal_tabsel_0 guibg=#704a85 guifg=#396b91
highlight LightlineLeft_normal_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_normal_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_normal_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight phpMemberSelector guifg=#202622
highlight LightlineLeft_insert_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight PmenuThumb guibg=#000000
highlight LightlineRight_inactive_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineMiddle_normal guibg=#dedcdc guifg=#283544
highlight LightlineRight_select_1 guibg=#dedcdc guifg=#734400
highlight StatusLine guibg=#734d06 guifg=#a9a3a3
highlight cStorageClass guifg=#55365e
highlight DiagnosticInfo guifg=#0b2a33
highlight LightlineLeft_insert_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineLeft_inactive_0 guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_select_0_tabsel guibg=#396b91 guifg=#734400
highlight lCursor guibg=#202622 guifg=#e1dfdf
highlight goBuiltins guifg=#934917
highlight LightlineRight_normal_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight Special guifg=#202622
highlight MoreMsg guifg=#899137
highlight htmlArg guifg=#902828
highlight LightlineLeft_insert_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_command_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_tabline_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_insert_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_replace_0 guibg=#790000 guifg=#e7e5e5
highlight LightlineRight_replace_2 guibg=#dedcdc guifg=#283544
highlight SpecialKey guifg=#b1aaaa
highlight LightlineRight_replace_1 guibg=#dedcdc guifg=#790000
highlight SignatureMarkText guibg=#e1dfdf guifg=#fc0000
highlight LightlineRight_visual_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineLeft_select_0_1 guibg=#dedcdc guifg=#734400
highlight Cursor guibg=#202622 guifg=#e1dfdf
highlight LightlineLeft_terminal_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight goException guifg=#55365e
highlight LightlineLeft_visual_0_1 guibg=#dedcdc guifg=#734400
highlight LightlineRight_visual_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_command_tabsel guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_tabline_0 guibg=#396b91 guifg=#e7e5e5
highlight LightlineRight_select_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_inactive_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight phpConditional guifg=#55365e
highlight LightlineRight_inactive_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight CursorColumn guibg=#d5d2d2
highlight RedrawDebugRecompose guibg=#fc0000
highlight diffRemoved guifg=#902828
highlight LightlineRight_tabline_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight LightlineRight_visual_tabsel_0 guibg=#734400 guifg=#396b91
highlight WildMenu guibg=#fbfc00
highlight LightlineLeft_replace_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight rubyRepeat guifg=#55365e
highlight LightlineMiddle_inactive guibg=#dedcdc guifg=#283544
highlight LightlineLeft_visual_0 guibg=#734400 guifg=#e7e5e5
highlight LightlineMiddle_visual guibg=#dedcdc guifg=#283544
highlight LightlineRight_command_2_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_terminal_0_1 guibg=#dedcdc guifg=#72ad63
highlight LightlineLeft_visual_1 guibg=#dedcdc guifg=#734400
highlight LightlineRight_select_tabsel_0 guibg=#734400 guifg=#396b91
highlight LightlineRight_select_tabsel_2 guibg=#dedcdc guifg=#396b91
highlight SignColumn guibg=#e1dfdf guifg=#00fbfc
highlight LightlineRight_inactive_0_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_inactive_tabsel guibg=#396b91 guifg=#e7e5e5
highlight pythonStatement guifg=#55365e
highlight LightlineLeft_select_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_tabline_0_tabsel guibg=#396b91 guifg=#396b91
highlight htmlTagName guifg=#902828
highlight cRepeat guifg=#55365e
highlight LightlineRight_replace_1_tabsel guibg=#396b91 guifg=#dedcdc
highlight LightlineRight_inactive_tabsel_0 guibg=#396b91 guifg=#396b91
highlight LightlineLeft_visual_tabsel guibg=#396b91 guifg=#e7e5e5
highlight DiagnosticHint guifg=#141212
highlight CursorLine guibg=#d5d2d2
highlight LightlineRight_inactive_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight SignatureMarkerText guibg=#e1dfdf guifg=#9cfc9c
highlight LightlineRight_tabline_0_1 guibg=#dedcdc guifg=#396b91
highlight coffeeKeyword guifg=#55365e
highlight LightlineLeft_inactive_0_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_visual_2 guibg=#dedcdc guifg=#283544
highlight LightlineLeft_inactive_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_terminal_tabsel_1 guibg=#dedcdc guifg=#396b91
highlight LightlineRight_insert_1_2 guibg=#dedcdc guifg=#dedcdc
highlight LightlineLeft_tabline_tabsel_0 guibg=#dedcdc guifg=#396b91
highlight LightlineLeft_tabline_tabsel_tabsel guibg=#396b91 guifg=#396b91
highlight pythonInclude guifg=#55365e
highlight pythonException guifg=#55365e
highlight pythonFunction guifg=#345773
highlight ShowMarksHLu guibg=#e1dfdf guifg=#734d06

