
" Sensible Vim {
	runtime! plugin/sensible.vim
" }

" Pathogen Runtime {
	execute pathogen#infect()
" }

" UI Options {
	set background=dark
	colorscheme solarized
	let g:solarized_termtrans=1
	set number
	set numberwidth=4

	if has('gui_running')
		set guioptions+=LlRrbTm " Workaround bacause 'guioptions' are buged.
		set guioptions-=LlRrbTm " Workaround bacause 'guioptions' are buged.
	endif
" }

" Folding {
	set foldenable
	" set foldmarker={,}
	" set foldmethod=marker
	set foldmethod=indent
	set foldlevel=99
	set foldopen=block,hor,mark,percent,quickfix,tag
" }

" Copy/Paste from Clipboard {
	nnoremap <C-v> "+p
	inoremap <C-v> <ESC>"+pi
	vnoremap <C-v> "+p

	nnoremap <C-c> "+yy
	inoremap <C-c> <ESC>"+yyi
	vnoremap <C-c> "+y
" }
