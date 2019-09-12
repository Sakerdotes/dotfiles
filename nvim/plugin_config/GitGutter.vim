
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

