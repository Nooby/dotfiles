execute pathogen#infect()

" Vim Plug Definitions {
call plug#begin('~/.vim/plugged')

" vim-sensible
Plug 'tpope/vim-sensible', {'tag': '*'}
" editorconfig support
Plug 'editorconfig/editorconfig-vim'
" ack.vim
Plug 'mileszs/ack.vim', {'tag': '*'}
" airline
Plug 'vim-airline/vim-airline', {'tag': '*'}
" airline-themes
Plug 'vim-airline/vim-airline-themes'
" ctrlp
"Plug 'ctrlpvim/ctrlp.vim', {'tag': '*'}
" tComment
Plug 'tomtom/tcomment_vim'
" fugitive
Plug 'tpope/vim-fugitive', {'tag': '*'}
" nerdtree
Plug 'scrooloose/nerdtree', {'tag': '*'}
" python-mode
Plug 'python-mode/python-mode', {'tag': '*'}
Plug 'davidhalter/jedi-vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'
" Terraform Completion and FMT
Plug 'hashivim/vim-terraform'

" Deoplete for NeoVim
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Intelisense/Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debuger Integration
Plug 'puremourning/vimspector', {'do': ':VimspectorInstall delve'}

" syntastic
Plug 'vim-syntastic/syntastic'
" ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Colors Themes
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'rainglow/vim'
" Plug 'rakr/vim-colors-rakr'
Plug 'liuchengxu/space-vim-dark'
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
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" python-language-server
" Plug 'ryanolsonx/vim-lsp-python' " pip install python-language-server[all]
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Language support
Plug 'chr4/nginx.vim'                          " nginx syntax highlighting
Plug 'digitaltoad/vim-pug'                     " Pug syntax highlighting
Plug 'kylef/apiblueprint.vim'                  " API Blueprint syntax highlighting
Plug 'lifepillar/pgsql.vim'                    " PostgreSQL syntax highlighting
Plug 'pangloss/vim-javascript'                 " JavaScript syntax highlighting
Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
Plug 'JamshedVesuna/vim-markdown-preview'      " Markdown preview
Plug 'hashivim/vim-terraform'                  " Terraform Completion and FMT
Plug 'mrk21/yaml-vim'                          " yaml
Plug 'tpope/vim-cucumber'
Plug 'dhruvasagar/vim-table-mode'
" Text Objects
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'
" Register Preview for " and <CTRL-r>
Plug 'junegunn/vim-peekaboo'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
    set shortmess+=c

    if !has('nvim')
        set encoding=utf-8 " Set default encoding to UTF-8
    endif

    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%100v.\+/
" }

" Hybrid Relative Line Number Mode {
    set number norelativenumber
    " set number relativenumber
    "
    " augroup numbertoggle
    "   autocmd!
    "   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    "   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    " augroup END
" }

" Mapleader {
    set showcmd " Show feedback on leader Key press.
    set timeoutlen=500 " Set the timeout for the Leader Key Combinations to half a second.
    nnoremap <SPACE> <Nop>
    map <SPACE> <leader>
    let g:mapleader = "\<Space>"
    let g:maplocalleader = ','
    nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
    nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" }

" UI Settings {
    " Also change setting in .gvimrc. MacVim does not respect this setting if
    " it is not set in the .gvimrc.
    if has('nvim')
        set guifont=Noto\ Mono\ for\ Powerline:h15
        colorscheme nord
        tnoremap <Esc> <C-\><C-n>
    endif
    if !has('nvim')
        set guifont=NotoMonoForPowerline:h15
    endif
    " set linespace=3

    if has("gui_running")
        set guioptions+=LlRrbTm
        set guioptions-=LlRrbTm
        set background=dark
        "colorscheme solarized
        colorscheme nord
        " call togglebg#map("F5")

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

" Syntastic Settings {
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_auto_jump = 0
    let g:syntastic_mode_map = { 'mode': 'active'} " , 'passive_filetypes': ['go'] }
" }

" coc.nvim {
    let g:coc_global_extensions = ['coc-json', 'coc-go', 'coc-snippets', 'coc-vimlsp', 'coc-swagger', 'coc-lightbulb', 'coc-fzf-preview']

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    let g:go_def_mapping_enabled = 0 " deactivate gd of vim-go in favour of coc's gd
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use U to show documentation in preview window
    nnoremap <silent> U :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <leader>r <Plug>(coc-rename)

    nnoremap <silent> <C-p> :<C-u>CocCommand fzf-preview.ProjectFiles<cr>
    nnoremap <silent> <leader>b :<C-u>CocCommand fzf-preview.Buffers<cr>

    " Using CocList
    " Show all diagnostics
    "nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <leader>a  :<C-u>CocCommand fzf-preview.CocDiagnostics<cr>
    nnoremap <silent> <leader>cr  :<C-u>CocCommand fzf-preview.CocReferences<cr>
    " Manage extensions
    "nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
    " Show commands
    "nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
    nnoremap <silent> <leader>co  :<C-u>CocCommand fzf-preview.CocOutline<cr>
    " Search workspace symbols
    nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    "nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
    " Call CocAction to apply suggested refactoring
    nnoremap <silent> <leader>ca :<C-u>CocAction<CR>
" }

" Deoplete {
    " let g:deoplete#enable_at_startup = 1
" }

" Vim-LSP {
    let g:lsp_diagnostics_anabled = 1
    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
" }

" Nerdtree {
    let NERDTreeQuitOnOpen=1
    let NERDTreeHijackNetrw = 0
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }

" Airline {
    " Use the Powerline Patched Fonts
    " https://github.com/powerline/fonts
    let g:airline_powerline_fonts=1
    let g:airline#extensions#whitespace#enabled = 0
" }

" Ultisnips {
    " let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"
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

" Shortcuts {
    " nnoremap <C-v> "+p
    inoremap <C-v> <ESC>"+p
    " vnoremap <C-v> "+p
    " nnoremap <C-c> "+yy
    inoremap <C-c> <ESC>"+yyi
    " vnoremap <C-c> "+y
    nnoremap Q @q
    vnoremap Q :norm @q<cr>
    noremap <C-l> <C-w>l
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-=> <C-w>=
    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

    nmap <leader>en :lnext<CR>
    nmap <leader>ep :lprev<CR>
    nmap <leader>eo :lopen<CR>

    " map <C-n> :NERDTreeToggle<CR>
    nmap <leader>n :NERDTreeToggle<CR>
    " asyncomplete.vim {
        " inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        " inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
        " imap <c-space> <Plug>(asyncomplete_force_refresh)
    " }
    " Language Server Shortcuts {
        " nmap gd <plug>(lsp-definition)
        " nmap <leader>h <plug>(lsp-hover)
        " nmap <leader>s <plug>(lsp-status)
        " nmap <leader>l <plug>(lsp-document-diagnostics)
        " nmap <leader>r <plug>(lsp-rename)
    " }
    " Fugitive Shortcuts {
        nmap <leader>gs :Git<CR>
        nmap <leader>gc :Git commit<CR>
        nmap <leader>gm :Git merge<CR>
        nmap <leader>gf :Git pull<CR>
        nmap <leader>gp :Git push<CR>
        " nmap <leader>gl :Gllog<CR>
        " nmap <leader>gb :Gblame<CR>
    " }
    " Vim-go shortcuts {
        " au FileType go nmap <buffer> <leader>r <Plug>(go-run)
        " au FileType go nmap <buffer> <leader>b <Plug>(go-build)
        " au FileType go nmap <buffer> <Leader>s <Plug>(go-implements)
        " au FileType go nmap <buffer> <Leader>i <Plug>(go-info)
        " au FileType go nmap <buffer> <Leader>r <Plug>(go-rename)
        " au FileType go nmap <buffer> <Leader>dd <Plug>(go-describe)
        " au FileType go nmap <buffer> <Leader>de <Plug>(go-def)
        " au FileType go nmap <buffer> <Leader>ds <Plug>(go-def-split)
        " au FileType go nmap <buffer> <Leader>dv <Plug>(go-def-vertical)
        " au FileType go nmap <buffer> <Leader>l <Plug>(go-metalinter)
        " au FileType go nmap <buffer> <Leader>f <Plug>(go-freevars)
    " }
" }

" Language: GO {
    au FileType go setlocal keywordprg=:GoDoc " Open help for word under cursor with K

    au FileType go set noexpandtab
    au FileType go set shiftwidth=4
    au FileType go set softtabstop=4
    au FileType go set tabstop=4
    au FileType go set foldmethod=syntax
    au FileType go set nolist

    au FileType go nmap <buffer> <Leader>p :GoDeclsDir<CR>
    au FileType go nmap <buffer> <leader>ta <Plug>(go-alternate-vertical)
    au FileType go nmap <buffer> <leader>tc <Plug>(go-coverage-toggle)

    let g:go_def_mode='gopls'
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_structs = 1
    let g:go_auto_type_info = 0
    let g:go_highlight_extra_types = 1
    let g:go_metalinter_command = "golangci-lint"
    " Run goimports when running gofmt
    let g:go_fmt_command = "goimports"
    " Fix for location list when vim-go is used together with Syntastic
    let g:go_list_type = "quickfix"
    " Set whether the JSON tags should be snakecase or camelcase.
    let g:go_addtags_transform = "snakecase"

    " Add the failing test name to the output of :GoTest
    let g:go_test_show_name = 1

    " Run goimports when running gofmt
    let g:go_fmt_command = "goimports"

    let g:syntastic_go_checkers = ['golangci-lint', 'golint', 'govet', 'errcheck']

    " au FileType go nmap <buffer> <leader>db :GoDebugBreakpoint<CR>
    " au FileType go nmap <buffer> <leader>dn :GoDebugStep<CR>
    " au FileType go nmap <buffer> <leader>dsi :GoDebugStep<CR>
    " au FileType go nmap <buffer> <leader>dso :GoDebugStepOut<CR>
    " au FileType go nmap <buffer> <leader>dp :GoDebugPrint 
    " au FileType go nmap <buffer> <leader>da :AttachDLV<CR>
    "
    " function! s:attach_dlv(line)
    "     let s = split(a:line)
    "     exec "GoDebugAttach".s[1]
    "     return s
    " endfunction
    "
    " command! AttachDLV call fzf#run({'source': 'ps -ef', 'sink': function('<sid>attach_dlv')})

    let g:go_debug_windows = {
                \ 'out': 'botright 5new',
                \ 'vars': 'leftabove 30vnew',
    \ }
    let g:go_debug_preserve_layout = 1

    let g:vimspector_configurations = {
        \   "run_vimrc": {
        \       "adapter": "delve",
        \       "filetypes": [ "go" ],
        \       "configuration": {
        \           "request": "launch",
        \           "program": "${fileDirname}",
        \           "mode": "debug"
        \   }}}
" }

" Debugger Integration {
    let g:vimspector_enable_mappings = 'HUMAN'
    nmap <Leader>db <Plug>VimspectorBreakpoints

    function! CustomPickProcess( ... ) abort
      let ps = 'ps aux'

      let line_selected = fzf#run( {
          \ 'source': ps,
          \ 'options': '--header-lines=1  '
          \          . '--prompt="Select Process: " '
          \ ,
          \
          \ } )[ 0 ]
      if empty( line_selected)
        return 0
      endif
      let pid = split( line_selected )[ 0 ]
      return str2nr( pid )
    endfunction

    let g:vimspector_custom_process_picker_func = 'CustomPickProcess'
" }

" Language: yaml {
    au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" }

" Language: Bash {
    au FileType sh set noexpandtab
    au FileType sh set shiftwidth=2
    au FileType sh set softtabstop=2
    au FileType sh set tabstop=2
" }

" Language: C++, C {
    " Register ccls C++ lanuage server.
    " if executable('ccls')
    "    au User lsp_setup call lsp#register_server({
    "       \ 'name': 'ccls',
    "       \ 'cmd': {server_info->['ccls']},
    "       \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
    "       \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
    "       \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
    "       \ })
    "    autocmd FileType cpp,c,cc setlocal omnifunc=lsp#complete
    " endif
    au FileType cpp,c,cc set expandtab
    au FileType cpp,c,cc set shiftwidth=4
    au FileType cpp,c,cc set softtabstop=4
    au FileType cpp,c,cc set tabstop=4
" }

" Language: CSS {
    au FileType css set expandtab
    au FileType css set shiftwidth=2
    au FileType css set softtabstop=2
    au FileType css set tabstop=2
" }

" Language: git {
    autocmd BufReadPost fugitive://* set bufhidden=delete
    au FileType gitcommit setlocal spell
    au FileType gitcommit setlocal textwidth=80
    au FileType gitconfig set noexpandtab
    au FileType gitconfig set shiftwidth=2
    au FileType gitconfig set softtabstop=2
    au FileType gitconfig set tabstop=2
" }

" Language: HTML {
    au FileType html,xhtml,xml,htmldjango,htmljinja set expandtab
    au FileType html,xhtml,xml,htmldjango,htmljinja set shiftwidth=2
    au FileType html,xhtml,xml,htmldjango,htmljinja set softtabstop=2
    au FileType html,xhtml,xml,htmldjango,htmljinja set tabstop=2
    au FileType html,xhtml,xml,htmldjango,htmljinja set foldmethod=indent
" }

" Language: JavaScript {
    au FileType javascript set expandtab
    au FileType javascript set shiftwidth=2
    au FileType javascript set softtabstop=2
    au FileType javascript set tabstop=2
" }

" Language: JSON {
    au FileType json set expandtab
    au FileType json set shiftwidth=2
    au FileType json set softtabstop=2
    au FileType json set tabstop=2
    com! FormatJSON %!python3 -m json.tool
    au FileType json nmap <buffer> =j :FormatJSON<CR>
" }

" Language: Make {
    au FileType make set noexpandtab
    au FileType make set shiftwidth=2
    au FileType make set tabstop=2
" }

" Language: Markdown {
    au FileType markdown setlocal spell
    au FileType markdown set expandtab
    au FileType markdown set shiftwidth=2
    au FileType markdown set softtabstop=2
    au FileType markdown set tabstop=2
    au FileType markdown set syntax=markdown
    let vim_markdown_preview_hotkey='<C-m>'
    let vim_markdown_preview_github=1
" }

" Language: Python {
"    if executable('pyls')
"        au User lsp_setup call lsp#register_server({
"            \ 'name': 'pyls',
"            \ 'cmd': {server_info->['pyls']},
"            \ 'whitelist': ['python'],
"            \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
"            \ })
"      autocmd FileType python setlocal omnifunc=lsp#complete
"    endif
    let g:jedi#usages_command = "<leader>c"
    let g:jedi#goto_command = "gd"
    let g:jedi#goto_assignments_command = "<leader>jg"
    let g:jedi#goto_definitions_command = "<leader>jd"
    let g:jedi#rename_command = "<leader>r"
    let g:syntastic_python_checkers = ['mypy', 'flake8', 'pylint'] " ['flake8', 'pylint', 'pyflakes', 'pep8']
    let g:syntastic_python_python_exec = 'python3'
    let g:pymode_indent = 1
    let g:pymode_motion = 1
    let g:pymode_python = 'python3'
    let g:pymode_syntax_all = 1
    let g:pymode_syntax_print_as_function = 1
    let g:pymode_lint = 0
    let g:pymode_rope_completion = 1
    let g:pymode_run = 0
    let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = "<leader>b"
    au FileType python set expandtab
    au FileType python set shiftwidth=4
    au FileType python set softtabstop=4
    au FileType python set tabstop=4
    autocmd FileType python setlocal foldmethod=indent
    autocmd BufWritePre *.py silent! execute ':Black'
    autocmd BufWritePre *.py silent! execute ':Isort'
" }

" Language: Terraform {
    let g:terraform_align=1
    let g:terraform_fmt_on_save=1
" }

" Language: vimscript {
    " http://vimcasts.org/e/34
    autocmd BufReadPost .vimrc setlocal keywordprg=:help " Open help for word under cursor with K
    autocmd BufReadPost .vimrc setlocal foldmethod=marker
    au FileType vim set expandtab
    au FileType vim set shiftwidth=4
    au FileType vim set softtabstop=4
    au FileType vim set tabstop=4
" }
