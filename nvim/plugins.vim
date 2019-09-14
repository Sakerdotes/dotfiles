" ============================================================================ "
" ===                               Plugins                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.vim/plugged')
" Gruvbox theme
Plug 'morhetz/gruvbox'
"Go-Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" File Icons
Plug 'ryanoasis/vim-devicons'
" File Icon colors
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Vue-Plugin
Plug 'posva/vim-vue'
"vim-Javascript
Plug 'pangloss/vim-javascript'
"Auto Mkdir
Plug 'benizi/vim-automkdir'
"COC
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
"COC vue plugin
Plug 'neoclide/coc-vetur'
"Coc json plugin
Plug 'neoclide/coc-json'
"Coc Typescript plugin
Plug 'neoclide/coc-tsserver'
"Coc Eslint plugn
Plug 'neoclide/coc-eslint'
"Coc prettier plugin
"Plug 'neoclide/coc-prettier'
"Coc css plugin
Plug 'neoclide/coc-css'
"Denite
Plug 'Shougo/denite.nvim'
"Vim autosave
Plug 'vim-scripts/vim-auto-save'
"Nerdtree
Plug 'scrooloose/nerdtree'
"lightline
Plug 'itchyny/lightline.vim'
"json formatter
Plug 'XadillaX/json-formatter.vim'
"Git Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
"Git code highlighting
Plug 'airblade/vim-gitgutter'
"Git Fugitive
Plug 'tpope/vim-fugitive'
"Text formatting
Plug 'godlygeek/tabular'
"Statusline plugin
Plug 'vim-airline/vim-airline'
"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"MatchTag
Plug 'gregsexton/MatchTag'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()
