execute pathogen#infect()

" Vim Plug Definitions {
call plug#begin('~/.vim/plugged')

" vim-sensible
Plug 'tpope/vim-sensible', {'tag': '*'}
" ack.vim
Plug 'mileszs/ack.vim', {'tag': '*'}
" airline
Plug 'vim-airline/vim-airline', {'tag': '*'}
" airline-themes
Plug 'vim-airline/vim-airline-themes'
" ctrlp
Plug 'ctrlpvim/ctrlp.vim', {'tag': '*'}
" dockerfile
" fugitive
Plug 'tpope/vim-fugitive', {'tag': '*'}
" neocomplete
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
" nerdtree
Plug 'scrooloose/nerdtree', {'tag': '*'}
" python-mode
Plug 'python-mode/python-mode', {'tag': '*'}
" syntastic
Plug 'vim-syntastic/syntastic'
" ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" vim-colors-solarized
Plug 'altercation/vim-colors-solarized'
" vim-go
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'nsf/gocode', { 'tag': '*' }
" vim-polyglot
Plug 'sheerun/vim-polyglot'
" vim-yaml
Plug 'mrk21/yaml-vim'
" ALE
" Plug 'w0rp/ale'
" Language Server
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" python-language-server
Plug 'ryanolsonx/vim-lsp-python' " pip install python-language-server[all]
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end()
" }

runtime! plugin/sensible.vim
silent! helptags ALL

" Basic Options {
    set nocompatible " Be iMproved
    set number " Show line numbers
    set ruler " Show line and column number
    syntax enable " Turn on syntax highlighting allowing local overrides
    set mouse=a
    set path+=**
    set wildmenu
    set noeb vb t_vb=

    command! MakeTags !ctags -R .

    if !has('nvim')
        set encoding=utf-8 " Set default encoding to UTF-8
    endif

    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%80v.\+/
" }

" Mapleader {
    set showcmd " Show feedback on leader Key press.
    set timeoutlen=2000 " Increase the timeout for the Leader Key Combinations from 1 second to 2.
    nnoremap <SPACE> <Nop>
    map <SPACE> <leader>
" }

" UI Settings {
    if has("gui_running")
        "set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 10
        "set guifont=Roboto\ Mono\ for\ Powerline\ 10
        "set guifont=Source\ Code\ Pro\ Medium\ for\ Powerline\ 10
        set guifont=Noto\ Mono\ for\ Powerline\ 10
        set guioptions+=LlRrbTm
        set guioptions-=LlRrbTm
        set background=dark
        colorscheme solarized
        call togglebg#map("F5")

        " Fixes Color of SignColumn
        hi! link SignColumn LineNr
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
    set backupdir=~/.vim/backup//      " Backup file location
    set directory=~/.vim/swap//        " Swap file location
    set undodir=~/.vim/undo//          " Undo file location
" }

" Folding {
    set foldmethod=syntax
    set foldlevel=20
    set foldlevelstart=20
    " nnoremap <space> za
    " vnoremap <space> zf
" }

" Copy/Paste from Clipboard {
    " nnoremap <C-v> "+p
    inoremap <C-v> <ESC>"+p
    " vnoremap <C-v> "+p
    " nnoremap <C-c> "+yy
    inoremap <C-c> <ESC>"+yyi
    " vnoremap <C-c> "+y
" }


" Shortcuts {
    nnoremap Q @q
    vnoremap Q :norm @q<cr>
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" }

" Autocmd {
    autocmd FileType html,xhtml,xml,htmldjango,htmljinja setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=indent
    autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 foldmethod=syntax nolist
    autocmd FileType python setlocal foldmethod=indent
    " http://vimcasts.org/e/34
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd BufReadPost .vimrc setlocal keywordprg=:help " Open help for word under cursor with K
    autocmd BufReadPost .vimrc setlocal foldmethod=marker
    " yaml settings
    au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" }

" Syntastic Settings {
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_auto_jump = 0
    let sessionoptions-=blank

    let g:syntastic_go_checkers = ['golangci_lint', 'golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active' }  ", 'passive_filetypes': ['go'] }

    let g:syntastic_python_checkers = ['pylint'] " ['flake8', 'pylint', 'pyflakes', 'pep8']
    let g:syntastic_python_python_exec = 'python3'
" }

" ALE {
"    let g:ale_completion_enabled = 1
"    let g:ale_fix_on_save = 1
"    let g:ale_linters = {'go': ['goimports', 'golangci-lint']}
"    let g:ale_fixers = {'go': ['goimports', 'gofmt']}
"    nmap <Leader>i <Plug>(ale_hover)
"    nmap gd <Plug>(ale_go_to_definition)
"    nmap gs <Plug>(ale_go_to_definition_in_split)
"    nmap gv <Plug>(ale_go_to_definition_in_vsplit)
"    nmap gt <Plug>(ale_go_to_type_definition)
"    imap <C-Space> <Plug>(ale_complete)
"    set keywordprg=<Plug>(ale_documentation) " Open help for word under cursor with K
" }

" vim-lsp {
augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'gopls',
      \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
      \ 'whitelist': ['go'],
      \ })
  autocmd FileType go setlocal omnifunc=lsp#complete
augroup END
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
  autocmd FileType python setlocal omnifunc=lsp#complete
endif
" }

" asyncomplete.vim {
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
" }


" Vim-Go {
   let g:go_def_mode='gopls'
   let g:go_highlight_functions = 1
   let g:go_highlight_methods = 1
   let g:go_highlight_fields = 1
   let g:go_highlight_types = 1
   let g:go_highlight_operators = 1
   let g:go_highlight_build_constraints = 1
   let g:go_auto_type_info = 0
   let g:go_metalinter_command = "golangci-lint"

   au FileType go setlocal keywordprg=:GoDoc " Open help for word under cursor with K
" }

" Nerdtree {
    " map <C-n> :NERDTreeToggle<CR>
    nmap <leader>n :NERDTreeToggle<CR>
    let NERDTreeQuitOnOpen=1
    let NERDTreeHijackNetrw = 0
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }

" Airline {
    " Use the Powerline Patched Fonts
    " https://github.com/powerline/fonts
    let g:airline_powerline_fonts=1
" }

" TODO: Change to deoplete
" Neocomplete {
"    let g:neocomplete#enable_at_startup = 1
"    let g:neocomplete#enable_smart_case = 1
"    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" }

" Ultisnips {
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }

" ack.vim {
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif
" }

" Jumplist {
    function! GotoJump()
        jumps
        let j = input("Please select your jump: ")
        if j != ''
            let pattern = '\v\c^\+'
            if j =~ pattern
                let j = substitute(j, pattern, '', 'g')
                execute "normal " . j . "\<c-i>"
            else
                execute "normal " . j . "\<c-o>"
            endif
        endif
    endfunction

    nmap <leader>j :call GotoJump()<CR>
" }

" Leader {
    nmap gd <plug>(lsp-definition)
    nmap <leader>h <plug>(lsp-hover)
    nmap <leader>s <plug>(lsp-status)
    nmap <leader>l <plug>(lsp-document-diagnostics)
    nmap <leader>en :lnext<CR>
    nmap <leader>ep :lprev<CR>
    nmap <leader>eo :lopen<CR>
    " Fugitive Shortcuts {
        nmap <leader>gs :Gstatus<CR>
        nmap <leader>gc :Gcommit<CR>
        nmap <leader>gm :Gmerge<CR>
        nmap <leader>gp :Gpull<CR>
        nmap <leader>gf :Gpush<CR>
        nmap <leader>gl :Gllog<CR>
        nmap <leader>gb :Gblame<CR>
    " }
    " Vim-go shortcuts {
        " au FileType go nmap <buffer> <leader>r <Plug>(go-run)
        " au FileType go nmap <buffer> <leader>b <Plug>(go-build)
        " au FileType go nmap <buffer> <Leader>s <Plug>(go-implements)
        " au FileType go nmap <buffer> <Leader>i <Plug>(go-info)
        " au FileType go nmap <buffer> <Leader>e <Plug>(go-rename)
        " au FileType go nmap <buffer> <Leader>dd <Plug>(go-describe)
        " au FileType go nmap <buffer> <Leader>de <Plug>(go-def)
        " au FileType go nmap <buffer> <Leader>ds <Plug>(go-def-split)
        " au FileType go nmap <buffer> <Leader>dv <Plug>(go-def-vertical)
        " au FileType go nmap <buffer> <Leader>l <Plug>(go-metalinter)
        " au FileType go nmap <buffer> <Leader>f <Plug>(go-freevars)
        " au FileType go nmap <buffer> <Leader>p :GoDeclsDir<CR>
        " au FileType go nmap <buffer> <leader>ta <Plug>(go-alternate-vertical)
        " au FileType go nmap <buffer> <leader>tc <Plug>(go-coverage-toggle)
    " }
" }
