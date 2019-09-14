
" ============================================================================ "
" ===                             KEYBINDINGS                              === "
" ============================================================================ "


"=== CUSTOM=== "


"use ,js to format json
nnoremap <leader>js :%!python -m json.tool<cr>
"use ,cd to set workingdir to current dir
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Reindent whole file
map <F7> gg=G<C-o><C-o>

"=== HTML KEYBINDINGS ==="
autocmd FileType html inoremap ;p <p></p><Enter><++><Esc>ki

"=== GO KEYBINDINGS ==="
autocmd FileType go inoremap ;struct type  struct {<Enter><++><Enter>}<Esc>kkf<Space>a
autocmd FileType go inoremap ;err if err != nil {<Enter>return err<Enter>}<Enter>
autocmd FileType go inoremap ;func func  (){<Enter><++><Enter>}<Esc>kkf<Space>a

