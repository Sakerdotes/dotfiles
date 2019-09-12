source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/plugins.vim

" Monokai-Pro Theme
set termguicolors
colorscheme monokai_pro

"Change number of spaces that a <Tab> counts for during editing ops
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

source ~/.config/nvim/plugin_config/VimGo.vim
source ~/.config/nvim/plugin_config/NerdTree.vim
source ~/.config/nvim/plugin_config/Coc.vim
source ~/.config/nvim/plugin_config/GitGutter.vim
source ~/.config/nvim/plugin_config/Denite.vim
source ~/.config/nvim/plugin_config/MarkdownPreview.vim



