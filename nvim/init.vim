source ~/.config/nvim/plugins.vim


" ============================================================================ "
" ===                       VARIABLES / CONFIGS                            === "
" ============================================================================ "

"set color theme
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

set langmap=ö[,ä],Ö{,Ä} 

"Change number of spaces that a <Tab> counts for during editing ops
set tabstop=4 shiftwidth=4

" Disable default Line
set noshowmode

set splitbelow              " Open hsplit below current window
set splitright              " Open vsplit to the right 
set scrolloff=3             " Display at least 3 lines above/below cursor
set sidescrolloff=3         " Display at least 3 columns right/left of cursor

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

"let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

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
let g:lightline.component_expand.cocstatus = 'cocstatus'
let g:lightline.component_type = {}
let g:lightline.component_type.buffers = 'tabsel'
let g:lightline.separator = {}
let g:lightline.separator.left = ''
let g:lightline.separator.right = '' 
let g:lightline.subseparator = {}
let g:lightline.subseparator.left = ''
let g:lightline.subseparator.right = ''


let g:lightline#bufferline#shorten_path     = 1
let g:lightline#bufferline#min_buffer_count = 1
let g:lightline#bufferline#unnamed          = '[No Name]'

au User CocDiagnosticChange call lightline#update()

"vim vue, only load when open vue file
let g:vue_pre_processors = 'detect_on_enter'


" === VimGo ===

" auto import dependencies
let g:go_fmt_command = "goimports"

" highlight same words
let g:go_auto_sameids = 1

" syntax default highlighting
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

"change definition to gopls
let g:go_def_mode = "gopls"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" use tabs over spaces
let g:prettier#config#use_tabs = 'true'

" wrap line after x character
let g:prettier#config#print_width = 80

let g:NERDTreeShowHidden = 1 " Show hidden files/directories
let g:NERDTreeMinimalUI = 1 " Remove bookmarks and help text from NERDTree
let g:NERDTreeHijackNetrw= 0
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]','\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeQuitOnOpen = 3
" === GitGutter === "

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0

highlight GitGutterAdd guifg=DarkGreen  ctermfg=DarkGreen
highlight GitGutterChange guifg=DarkYellow ctermfg=DarkYellow 
highlight GitGutterDelete guifg=Red ctermfg=Red

" Markdown Preview
let g:mkdp_auto_close = 1


" ============================================================================ "
" ===                             KEYBINDINGS                              === "
" ============================================================================ "


"disable arrow keys for learning purposes
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>


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
map <F7> gg=G<C-o><C-o>


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


" === Denite shorcuts === "

"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
let mapleader=","
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
	imap <silent><buffer> <C-o>
				\ <Plug>(denite_filter_quit)
	inoremap <silent><buffer><expr> <Esc>
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Esc>
				\ denite#do_map('quit')
	inoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently select
"   q or <Esc>  - Quit Denite window

"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
	nnoremap <silent><buffer><expr> <CR>
				\ denite#do_map('do_action')
	nnoremap <silent><buffer><expr> q
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Esc>
				\ denite#do_map('quit')
	nnoremap <silent><buffer><expr> d
				\ denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p
				\ denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> i
				\ denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> <C-o>
				\ denite#do_map('open_filter_buffer')
endfunction




" ============================================================================ "
" ===                              COMMANDS                                === "
" ============================================================================ "



"=== HTML KEYBINDINGS ==="
autocmd FileType html inoremap ;p <p></p><Enter><++><Esc>ki

"=== GO KEYBINDINGS ==="
autocmd FileType go inoremap ;struct type  struct {<Enter><++><Enter>}<Esc>kkf<Space>a
autocmd FileType go inoremap ;err if err != nil {<Enter>return err<Enter>}<Enter>
autocmd FileType go inoremap ;func func(){<Enter><++><Enter>}<Esc>kkf<Space>a


" automaticly format on save trigger
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.vue Prettier

" Automaticly formats go code on save, dont know why this is needed
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile') 


" === NERDTree === "

" Close nerdtree when its the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd bufenter * if (len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 0 && winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Open Nerdtree as only window on open folder
" Open NERDTree automatically if vim starts up opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'bd' | exe 'NERDTree' argv()[0] |  exe 'cd '.argv()[0] | endif


"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" ============================================================================ "
" ===                             Setup                              === "
" ============================================================================ "

" === Denite setup stuff === "

try
	call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
	call denite#custom#var('grep', 'command', ['rg', '--threads', '1'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'final_opts', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
	call denite#custom#var('buffer', 'date_format', '')
	call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
	call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
	call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')


	let s:denite_options = {'default' : {
				\ 'split': 'floating',
				\ 'start_filter': 1,
				\ 'auto_resize': 1,
				\ 'source_names': 'short',
				\ 'prompt': 'λ:',
				\ 'statusline': 0,
				\ 'highlight_matched_char': 'WildMenu',
				\ 'highlight_matched_range': 'Visual',
				\ 'highlight_window_background': 'Visual',
				\ 'highlight_filter_background': 'StatusLine',
				\ 'highlight_prompt': 'StatusLine',
				\ 'winrow': 1,
				\ 'vertical_preview': 1
				\ }}

	" Loop through denite options and enable them
	function! s:profile(opts) abort
		for l:fname in keys(a:opts)
			for l:dopt in keys(a:opts[l:fname])
				call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
			endfor
		endfor
	endfunction

	call s:profile(s:denite_options)
catch
	echo 'Denite not installed. It should work after running :PlugInstall'
endtry



