
" ============================================================================ "
" ===                             KEYBINDINGS                              === "
" ============================================================================ "

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

"=== END DENITE === "


"use ,js to format json
nnoremap <leader>js :%!python -m json.tool<cr>

"use ,cd to set workingdir to current dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

nnoremap <leader><Space> <Esc>/<++><Enter>"_c4l

"=== HTML KEYBINDINGS ==="
autocmd FileType html inoremap ;p <p></p><Enter><++><Esc>ki

"=== GO KEYBINDINGS ==="
autocmd FileType go inoremap ;struct type  struct {<Enter><++><Enter>}<Esc>kkf<Space>a
autocmd FileType go inoremap ;err if err != nil {<Enter>return err<Enter>}<Enter>
autocmd FileType go inoremap ;func func  (){<Enter><++><Enter>}<Esc>kkf<Space>a

"extract to variable
"autocmd FileType go vnoremap <leader>m xi<++><Esc>Os<Space>:=<Space><Esc>p0dfsi
"autocmd FileType go nnoremap <leader>m 0vf<Space>hy<Esc>,<Space><Esc>p
"autocmd FileType go nnoremap ,l :!make run<Enter>
