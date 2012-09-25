" Debian {
    runtime! debian.vim
" }

" Plugin Configuration {
    " NERDTree {
        nnoremap <C-n> :NERDTreeToggle<CR>
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
        nnoremap <F8> :TagbarToggle<CR> 
        let g:tagbar_autoclose = 1
        let g:tagbar_autofocus = 1
	let g:tagbar_autoshowtag = 1
    " }
    
    " Gundo {
        nnoremap <F6> :GundoToggle<CR>
    " }

    " AsyncFinder {
        map <F2> :AsyncFinder<CR>
    " }
" }

" Basic {

    " Syntax {
        if has("syntax")
            syntax on
        endif
    " }

    " Formatoptions {
        set formatoptions-=cqt
        set formatoptions+=cqt
    " }

    filetype on
    filetype plugin indent on
    set nocompatible
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
    "set hlsearch
    set nowrap
    set nobackup
    set nowritebackup
    set noswapfile
    set incsearch
    set scrolloff=2
    set colorcolumn=80
" }

" Vim UI {
    " Standard Colorscheme {
        set background=dark
        set t_Co=256
        colorscheme xoria256
    " }

    " GUI {
        if has('gui_running')
            set guioptions+=LlRrbTm " Workaround because 'guioptions' are buggy.
            set guioptions-=LlRrbTm
            colorscheme solarized
        endif
    " }
    
    " Status Line {  
        set laststatus=2                             " always show statusbar  
        set statusline=  
        set statusline+=%-10.3n\                     " buffer number  
        set statusline+=%f\                          " filename   
        set statusline+=%h%m%r%w                     " status flags  
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
        set statusline+=%=                           " right align remainder  
        set statusline+=0x%-8B                       " character value  
        set statusline+=%-14(%l,%c%V%)               " line, character  
        set statusline+=%<%P                         " file position  
    "}

    set novisualbell
    set number
    set numberwidth=4
    set shortmess=aOstT
    set showcmd
    set showmatch
    set sidescrolloff=5
" }

" Folding {
    set foldenable
    set foldmarker={,}
    "set foldmarker={{{,}}}
    set foldmethod=marker
    set foldlevel=99
    set foldopen=block,hor,mark,percent,quickfix,tag
    "set foldtext=SimpleFoldText()
" }

" Language {
    " Python {
        autocmd FileType python setlocal nowrap omnifunc=pythoncomplete#Complete foldmethod=indent

        " Comment Shortcut {
        "    autocmd FileType python vnoremap <C-#> :'<,'>s/^/#/<CR>:nohls<CR>
        "    autocmd FileType python nnoremap <C-#> :s/^/#/<CR>:nohls<CR>
        " }

        " pyflakes {
            autocmd FileType python let g:pyflakes_use_quickfix = 1
            autocmd FileType python map <buffer> <F3> :call Pyflakes()<CR> 
        " }

        " Pylint {
            autocmd FileType python let g:pylint_onwrite = 0
            autocmd FileType python compiler pylint
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

        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    " }
    
    " Go Lang {
        autocmd BufNewFile,BufRead *.go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
    " }

    " Make {
        autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
    " }
" }

" Functions {
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
" }

" Maping {
    nnoremap <space> za
    vnoremap <space> zf
    "nnoremap <silent> <F8> :TlistToggle<CR>
    nnoremap <silent> <F9> :TaskList<CR>

    " Movement Bindings {
        nmap <C-h> <C-w>h
        nmap <C-j> <C-w>j
        nmap <C-k> <C-w>k
        nmap <C-l> <C-w>l
    " }

    " Quick Save {
        nnoremap <C-s> :w<CR>
        inoremap <C-s> <ESC>:w<CR>
        vnoremap <C-s> <ESC>:w<CR>
    " }
    
    " Easy escape {
        imap ;; <Esc>
    " }

    " Copy/Paste from Clipboard {
        nnoremap <C-v> "+p
        inoremap <C-v> <ESC>"+pi
        vnoremap <C-v> "+p
        
        nnoremap <C-c> "+yy
        inoremap <C-c> <ESC>"+yyi
        vnoremap <C-c> "+y
    " }

    " Folding Toggle {
        nnoremap <F12> :call ToggleFolding()<CR>
        inoremap <F12> <ESC>:call ToggleFolding()<CR>
        vnoremap <F12> <ESC>:call ToggleFolding()<CR>
    " }
" }
