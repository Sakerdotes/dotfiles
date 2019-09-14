source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/plugins.vim

" set color theme
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"Change number of spaces that a <Tab> counts for during editing ops
set tabstop=4 shiftwidth=4

" Disable default Line
set noshowmode

" Hides buffers instead of closing them
set hidden

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

"Send to system clipboard
set clipboard+=unnamed

" customise line numbers
set number
set relativenumber
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" set line dots and tabs
set list
set listchars=tab:>.,trail:·,extends:>,precedes:<,nbsp:_

" fasten updatetime
set updatetime=100

" use tabs over spaces
let g:prettier#config#use_tabs = 'true'

" wrap line after x character
let g:prettier#config#print_width = 80

" automaticly format on save trigger
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.vue Prettier

" Automaticly formats go code on save, dont know why this is needed
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile') 


source ~/.config/nvim/plugin_config/VimGo.vim
source ~/.config/nvim/plugin_config/NerdTree.vim
source ~/.config/nvim/plugin_config/Coc.vim
source ~/.config/nvim/plugin_config/GitGutter.vim
source ~/.config/nvim/plugin_config/Denite.vim
source ~/.config/nvim/plugin_config/MarkdownPreview.vim

