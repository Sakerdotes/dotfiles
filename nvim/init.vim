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

let g:coc_global_extensions = ['coc-tsserver', 'coc-eslint', 'coc-vetur', 'coc-css', 'coc-json', 'coc-html', 'coc-phpls']

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox' " Color Scheme | dark theme
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Language support for GOLANG
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'} " Autocompletion plugin
Plug 'tpope/vim-surround' " Bracket edit 
Plug 'Raimondi/delimitMate' " Auto close brackets
Plug 'posva/vim-vue' " Vue highlighting
Plug 'tomtom/tcomment_vim' " Comment multiple lines
Plug 'scrooloose/nerdtree' " FileBrowser plugin
Plug 'Xuyuanp/nerdtree-git-plugin' " FileBrowser Git highlighting
Plug 'airblade/vim-gitgutter' " Git modified icons in editor, git changes highlight/functions
Plug 'novadev94/lightline-onedark' " Lightline color theme
Plug 'XadillaX/json-formatter.vim' " Json formatter
Plug 'tpope/vim-fugitive' " Awesome git plugin
Plug 'godlygeek/tabular' " Text formatting
Plug 'itchyny/lightline.vim' " Statusbar customise plugin
Plug 'mengelbrecht/lightline-bufferline' " Bufferline plugin for lightline
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }} "Markdown preview
Plug 'gregsexton/MatchTag' " Automaticly close html tags
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Code syntax styling
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Devicons need to be loaded after the nerdtree git plugin to prevent alignment errors!
Plug 'ryanoasis/vim-devicons' "Icons for filetypes
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Colorize the nerdtree vim devicons

call plug#end()


" ============================================================================ "
" ===                       VARIABLES / CONFIGS                            === "
" ============================================================================ "

" --- Color Settings --- "

set termguicolors " Use terminal colors in vim
"let g:gruvbox_contrast_dark = 'hard' " Enables dark contrast mode
colorscheme gruvbox " Use gruvboc color theme
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE

" --- Default --- "

set tabstop=4                "  Number of spaces a tab counts for
set shiftwidth=4             "  Number of spaces to use for each step of (auto)indent
set noshowmode               "  Disable default Line
set splitbelow               "  Open hsplit below current window
set splitright               "  Open vsplit to the right
set scrolloff=3              "  Display at least 3 lines above/below cursor
set sidescrolloff=3          "  Display at least 3 columns right/left of cursor
set hidden                   "  Hides buffers instead of closing them
set cmdheight=2              "  Display height for messages
set shortmess+=c             "  Shut off default completion messages
set signcolumn=yes           "  always show signcolumns
set number                   "  Activate line numbers
set relativenumber           "  Activate relative line numbers
set list                     "  Activate highlits for spaces,tabs,etc
set listchars=tab:>.,trail:· "  Set chars for list highlights
set updatetime=100           "  Set Vim Updatetime, in miliseconds


" --- Lightline Configuration --- "

let g:lightline = {}
let g:lightline.colorscheme = 'onedark'
let g:lightline.active = {}
let g:lightline.active.left = [[ 'mode', 'paste' ],[ 'cocstatus', 'readonly', 'modified' ]] 
let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'fugitive#head'
let g:lightline.tabline = {}
let g:lightline.tabline.left = [['buffers']]
let g:lightline.tabline.right = [['gitbranch']]
let g:lightline.component_expand = {}
let g:lightline.component_expand.buffers = 'lightline#bufferline#buffers'
let g:lightline.component_expand.cocstatus = 'cocstatuss'
let g:lightline.component_type = {}
let g:lightline.component_type.buffers = 'tabsel'
let g:lightline.separator = {}
let g:lightline.separator.left = ''
let g:lightline.separator.right = '' 
let g:lightline.subseparator = {}
let g:lightline.subseparator.left = ''
let g:lightline.subseparator.right = ''

let g:lightline#bufferline#shorten_path     = 1 " Show short path name of buffers
let g:lightline#bufferline#min_buffer_count = 1 " min value needed to show bufferline
let g:lightline#bufferline#unnamed          = '[No Name]' " Name from unnamed buffers

let g:vue_pre_processors = 'detect_on_enter' "vim vue, only load when open vue file detected

" Golang syntax highlighting options
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_variable_declaration = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports" " Auto import dependencies
let g:go_auto_sameids = 0          " highlight same words
let g:go_def_mode = "gopls"        "change definition tool to gopls

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:prettier#config#use_tabs = 'true' " use tabs over spaces
let g:prettier#config#print_width = 80 " wrap line after x character

let g:NERDTreeShowHidden = 1  " Show hidden files/directories
let g:NERDTreeMinimalUI = 1   " Remove bookmarks and help text from NERDTree
let g:NERDTreeHijackNetrw = 0 " Use Nerdtree instead of netrw
let g:loaded_netrw       = 1  " Set the netrw is loaded flag
let g:loaded_netrwPlugin = 1  " Set the netrw plugin is loaded flag
let g:NERDTreeDirArrowExpandable = '▸' " Custom icons for expandable directories
let g:NERDTreeDirArrowCollapsible = '▾' " Custom icons for expanded directories
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]','\.idea$[[dir]]', '\.sass-cache$'] " Hide certain files and directories from NERDTree
let g:NERDTreeQuitOnOpen = 1 " Nerdtree closes after file is opened"
let g:NERDTreeShowIgnoredStatus = 1 " Highlight .gitignored files
highlight! link NERDTreeFlags NERDTreeDir " Disable coloring for dirs,flags and links

" === GitGutter === "

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0

" Markdown Preview
let g:mkdp_auto_close = 1

" Change open split key
let g:NERDTreeMapOpenSplit = "h"

" ============================================================================ "
" ===                             KEYBINDINGS                              === "
" ============================================================================ "

let mapleader=","

"disable arrow keys for learning purposes
map i <Up>
map j <Left>
map k <Down>
noremap h i

" Switches Buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"use ,cd to set workingdir to current dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Reindent whole file
map <F7> gg=G

"Map Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Markdown Preview
nnoremap <M-m> :MarkdownPreview<CR>


" === Coc.nvim === "

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  /Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" ============================================================================ "
" ===                              COMMANDS                                === "
" ============================================================================ "

" Return to the same line when you reopen a file.
augroup line_return
	autocmd!
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\     execute 'normal! g`"zvzz' |
		\ endif
augroup END

"=== GO LIVETEMPLATES ==="
autocmd FileType go inoremap ;struct type  struct {<Enter><++><Enter>}<Esc>kkf<Space>a
autocmd FileType go inoremap ;err if err != nil {<Enter>return err<Enter>}<Enter>
autocmd FileType go inoremap ;func func(){<Enter><++><Enter>}<Esc>kkf<Space>a


" Open NERDTree automatically if vim starts up opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'bd' | exe 'NERDTree' argv()[0] |  exe 'cd '.argv()[0] | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close nerdtree when its the last window open

autocmd User CocDiagnosticChange call lightline#update() " Updates lightline everytime coc updates its diagnostics
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif "Close preview window when completion is done.

autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.vue Prettier " automaticly format on save trigger
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile') " Automaticly formats go code on save, dont know why this is needed


" ============================================================================ "
" ===                             Setup                              === "
" ============================================================================ "


function! s:init_search_buffer() abort
	execute 'resize' float2nr(0.4 * &lines)
	execute 'tnoremap <silent> <buffer> <C-s> <C-\><C-n>:<C-u>call <SID>toggle_fullscreen_search()<CR>'
	execute 'tnoremap <silent> <buffer> <C-a> <Esc><C-\><C-n>:<C-u>call <SID>set_filter_search()<CR>'
endfunction

function! s:toggle_fullscreen_search() abort
	let l:defaultsize = float2nr(0.4 * &lines)
	if l:defaultsize == winheight('%')
		tab split
	else
		tabclose
		resize 1
		execute 'resize' float2nr(0.4 * &lines)
	endif
	normal! i
endfunction

function! s:set_filter_search() abort
	call inputsave()
	let name = input('Enter pattern: ')
	call inputrestore()
	call OpenPatternSearch(name)
endfunction

function! OpenSearch() abort
	call fzf#run(fzf#wrap('File-Search',{
				\ 'source':  "find -path '*/\.*' -prune -o -type f -print 2> /dev/null",
				\ 'options':  '--reverse --preview "highlight -O ansi -l {} 2> /dev/null "',
				\ "window":  "bot split new",
				\ }))
	call s:init_search_buffer()
endfunction


function! OpenPatternSearch(pattern) abort
	call fzf#run(fzf#wrap('File-Pattern-Search',{
				\ 'source':  'rg --files-with-matches --no-messages "'.a:pattern.'"',
				\ 'options':  '--reverse --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors ''match:bg:yellow'' --ignore-case --pretty --context 10 '''.a:pattern.''' | rg --ignore-case --pretty --context 10 '''.a:pattern.''' {}"',
				\ "window":  "bot split new",
				\ }))
	call s:init_search_buffer()
endfunction

nnoremap <silent> <Leader>s :call OpenSearch()<CR>
