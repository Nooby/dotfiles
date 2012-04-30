" Debian {
    runtime! debian.vim
" }

" Plugin Configuration {
    " NERDTree {
        map <C-n> :NERDTreeToggle<CR>
    " }

    " Pathogen {
        call pathogen#infect()
    " }

    " Tab Completion {
        let g:SuperTabDefaultCompletionType = "context"
        set completeopt=menuone,longest,preview
    " }
    
    " TagList {
        let Tlist_GainFocus_On_ToggleOpen = 1 
        let Tlist_Close_On_Select = 1
        let Tlist_Show_One_File = 1
    " }
    
    " TagBar {
        nmap <F8> :TagbarToggle<CR> 
        let g:tagbar_autoclose = 1
        let g:tagbar_autofocus = 1
	let g:tagbar_autoshowtag = 1
    " }
    
    " Gundo {
        nnoremap <F6> :GundoToggle<CR>
    " }
" }

" Basic {
    set nocompatible

    " Syntax {
        if has("syntax")
            syntax on
        endif
    " }

    " set textwidth=79
    " set linebreak

    " Formatoptions {
        set formatoptions-=cqt
        set formatoptions+=cqt
    " }

    filetype on
    filetype plugin indent on
    set clipboard+=unnamed
    set hidden
    set mouse=a
    set noerrorbells
    set wildmenu
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    set wildmode=list:longest
    set shiftwidth=4
    set softtabstop=4
    set tabstop=8
    set expandtab
    set ignorecase 
    set smartcase
    set hlsearch
    set nowrap
    set nobackup
    set nowritebackup
    set noswapfile
    set incsearch
    set scrolloff=2
" }

" Vim UI {
    set background=dark
    set t_Co=256
    colorscheme xoria256

    " GUI {
        if has('gui_running')
            set guioptions+=LlRrbTm " Workaround because 'guioptions' are buggy.
            set guioptions-=LlRrbTm
            colorscheme solarized
        endif
    " }

    set novisualbell
    set number
    set numberwidth=5
    set shortmess=aOstT
    set showcmd
    set showmatch
    set sidescrolloff=5
" }

" Folding {
    set foldenable
    set foldmarker={,}
    set foldmethod=marker
    set foldlevel=99
    set foldopen=block,hor,mark,percent,quickfix,tag
    set foldtext=SimpleFoldText()
" }

" Language {
    " Python {
        "autocmd FileType python map <F5> :w!<CR>:!python "%"<CR>
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType python compiler pylint
        autocmd FileType python set nowrap
        autocmd FileType python set foldmarker={{{,}}}
        autocmd FileType python set foldmethod=indent

        " Comment Shortcut {
        "    autocmd FileType python vnoremap <C-#> :'<,'>s/^/#/<CR>:nohls<CR>
        "    autocmd FileType python nnoremap <C-#> :s/^/#/<CR>:nohls<CR>
        " }

        " pyflakes {
            autocmd FileType python let g:pyflakes_use_quickfix = 1
            autocmd FileType python map <buffer> <F3> :call Pyflakes()<CR> 
        " }

        " Pep8 {
            "autocmd FileType python let g:pep8_map='<C-8>'
        " }
        
        " Pylint {
            let g:pylint_onwrite = 0
        " }
    "}

    " Html/XHMTL/JavaScript/CSS {
        autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        " autocmd FileType html,xhtml map <silent> <F5> :w<CR>:!firefox "%" &<CR>
        autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
        autocmd BufNewFile,BufRead *.mako setlocal ft=mako
        autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
        autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
        autocmd BufNewFile,BufRead *.html,*.htm setlocal ft=htmldjango

        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
        autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    " }
" }

" Functions {
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }

    function! ToggleFolding() " {
        if !exists("b:NoobyFoldingMode")
            let b:NoobyFoldingMode = "CStyle"
        endif

        if (b:NoobyFoldingMode == "Indent")
            let b:NoobyFoldingMode = "CStyle"
            set foldmarker={,}
            set foldmethod=marker
        else
            let b:NoobyFoldingMode = "Indent"
            set foldmarker={{{,}}}
            set foldmethod=indent
        endif

        echo b:NoobyFoldingMode
    endfunction " }

    "function! BindingTest() " { Test Function for development only.
    "    echo 'Binding Works!'
    "endfunction " }
" }

" Maping {
    nnoremap <space> za
    vnoremap <Space> zf
    "nnoremap <silent> <F8> :TlistToggle<CR>
    "nnoremap <silent> <F9> :TaskList<CR>

    " Movement Bindings {
        map <c-j> <c-w>j
        map <c-k> <c-w>k
        map <c-l> <c-w>l
        map <c-h> <c-w>h
    " }

    " Autocmd {
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h |  endif
    " }

    " Quick Save {
        nnoremap <C-s> :w<CR>
        inoremap <C-s> <ESC>:w<CR>
        vnoremap <C-s> <ESC>:w<CR>
    " }

    " Copy/Paste from Clipboard {
        nnoremap <C-v> "+p
        inoremap <C-v> <ESC>"+p
        vnoremap <C-v> "+p
        
        nnoremap <C-c> "+yy
        inoremap <C-c> <ESC>"+yy
        vnoremap <C-c> "+y
    " }

    " Folding Toggle {
        nnoremap <F12> :call ToggleFolding()<CR>
        inoremap <F12> <ESC>:call ToggleFolding()<CR>
        vnoremap <F12> <ESC>:call ToggleFolding()<CR>
    " }
" }
