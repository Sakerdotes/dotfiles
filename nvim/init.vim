source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/plugins.vim

" Monokai-Pro Theme
set termguicolors
colorscheme monokai_pro

" Change number of spaces that a <Tab> counts for during editing ops
set tabstop=4 shiftwidth=4

" Disable default Line
set noshowmode

" customise line numbers
set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" set line dots and tabs
set list
"set listchars=tab:»\. ,extends:›,precedes:‹,nbsp:·,trail:·
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+

" fasten updatetime
set updatetime=100

" go specific configurations

" auto import dependencies
let g:go_fmt_command = "goimports"
" highlight same words
let g:go_auto_sameids = 1
" syntax default highlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_def_mode = "gopls"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0


source ~/.config/nvim/plugins_config.vim


