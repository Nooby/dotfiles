execute pathogen#infect()
runtime! plugin/sensible.vim

" Basic Options {
    set nocompatible " Be iMproved
    set number " Show line numbers
    set ruler " Show line and column number
    syntax enable " Turn on syntax highlighting allowing local overrides
    set mouse=a

    if !has('nvim')
        set encoding=utf-8 " Set default encoding to UTF-8
    endif
" }

" UI Settings {
    set background=dark
    colorscheme solarized
    call togglebg#map("F5")

    " Fixes Color of SignColumn
    hi! link SignColumn LineNr

    if has("gui_running")
        set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 10
        "set guifont=Roboto\ Mono\ for\ Powerline\ 10
        "set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
        set guioptions+=LlRrbTm
        set guioptions-=LlRrbTm
    endif
" }

" Whitespace {
    set nowrap                        " don't wrap lines
    set tabstop=4                     " a tab is two spaces
    set shiftwidth=4                  " an autoindent (with <<) is two spaces
    set expandtab                     " use spaces, not tabs
    set list                          " Show invisible characters
    set backspace=indent,eol,start    " backspace through everything in insert mode
" }

" List chars {
    set listchars=""                  " Reset the listchars
    set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
    set listchars+=trail:.            " show trailing spaces as dots
    set listchars+=extends:>          " The character to show in the last column when wrap is
                                      " off and the line continues beyond the right of the screen
    set listchars+=precedes:<         " The character to show in the last column when wrap is
                                      " off and the line continues beyond the left of the screen
" }

" Searching {
    set hlsearch    " highlight matches
    set incsearch   " incremental searching
    set ignorecase  " searches are case insensitive...
    set smartcase   " ... unless they contain at least one capital letter
" }

" Backup and Swap {
    set backupdir^=~/.vim/_backup//    " where to put backup files.
    set directory^=~/.vim/_temp//      " where to put swap files.
" }

" Folding {
    set foldmethod=syntax
    set foldlevel=20
    set foldlevelstart=20
    nnoremap <space> za
    vnoremap <space> zf
" }

" Syntastic Settings {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" }

" Copy/Paste from Clipboard {
    nnoremap <C-v> "+p
    inoremap <C-v> <ESC>"+p
    vnoremap <C-v> "+p
    nnoremap <C-c> "+yy
    inoremap <C-c> <ESC>"+yyi
    vnoremap <C-c> "+y
" }


" Shortcuts {
    nnoremap Q @q
    vnoremap Q :norm @q<cr>
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k

    " format the entire file
    nnoremap <leader>fef :normal! gg=G``<CR>

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%
" }

" Autocmd {
    autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=indent
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 foldmethod=syntax nolist
    " http://vimcasts.org/e/34
    autocmd BufReadPost fugitive://* set bufhidden=delete
" }


" Nerdtree {
    map <C-n> :NERDTreeToggle<CR>
    let NERDTreeQuitOnOpen=1
    let NERDTreeHijackNetrw = 0
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }

" Airline {
    " Use the Powerline Patched Fonts
    " https://github.com/powerline/fonts
    let g:airline_powerline_fonts=1
" }

" Syntastic {
    let g:syntastic_check_on_open=1
    let g:syntastic_go_checkers=['golint', 'govet', 'errcheck']
    let g:syntastic_auto_loc_list=2
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
" }

" YouCompleteMe {
    let g:ycm_confirm_extra_conf = 1
    let g:ycm_python_binary_path = '/usr/bin/python3'
" }
