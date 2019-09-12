
" === NERDTree === "

"Map Ctrl-n to toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Open NERDTree automatically if vim starts up opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeShowHidden = 1 " Show hidden files/directories
let g:NERDTreeMinimalUI = 1 " Remove bookmarks and help text from NERDTree

:" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']



