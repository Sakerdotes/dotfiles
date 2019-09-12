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
" monokai pro theme
Plug 'phanviet/vim-monokai-pro'
"Go-Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Vue-Plugin
Plug 'posva/vim-vue'
"vim-Javascript
Plug 'pangloss/vim-javascript'
"Auto Mkdir
Plug 'benizi/vim-automkdir'
"COC
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
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
"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"MatchTag
Plug 'gregsexton/MatchTag'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()
