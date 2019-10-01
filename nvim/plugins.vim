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

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-vetur', 'coc-css', 'coc-json', 'coc-html']

call plug#begin('~/.vim/plugged')
" SQL
"Plug 'tpope/vim-dadbod'

" Gruvbox theme
Plug 'morhetz/gruvbox'
"Go-Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" File Icons
Plug 'ryanoasis/vim-devicons'
" File Icon colors
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"COC
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
"Bracket edit 
Plug 'tpope/vim-surround'
"auto close brackets
Plug 'Raimondi/delimitMate'
"Vue highlighting
Plug 'posva/vim-vue'
"comment lines
Plug 'tomtom/tcomment_vim'
"Denite
Plug 'Shougo/denite.nvim'
"Nerdtree
Plug 'scrooloose/nerdtree'
"lightline
Plug 'itchyny/lightline.vim'
" lightline color theme
Plug 'novadev94/lightline-onedark'
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
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"MatchTag
Plug 'gregsexton/MatchTag'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()
