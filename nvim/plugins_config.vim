

" === NERDTree === "

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Map Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree automatically if vim starts up opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']


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

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" always show hybrid line numbers
"set nu rnu
"Send to system clipboard
set clipboard+=unnamed
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

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


" === GitGutter === "


let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_highlight_linenrs = 0
"let g:gitgutter_terminal_reports_focus=0
"let g:gitgutter_override_sign_column_highlight = 0

highlight GitGutterAdd guifg=DarkGreen  ctermfg=DarkGreen
highlight GitGutterChange guifg=DarkYellow ctermfg=DarkYellow 
highlight GitGutterDelete guifg=Red ctermfg=Red

" === Denite config === "


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


" === Markdown === "

" Markdown Preview
let g:mkdp_auto_close = 1
nnoremap <M-m> :MarkdownPreview<CR>





