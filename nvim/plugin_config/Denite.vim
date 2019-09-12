
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


