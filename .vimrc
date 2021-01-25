"----------- HOTKEYS -------------
" Tags, g + ] (alt+9) -> all tags
" Go to tag, Ctrl + ]
"SHIFT + 1,2,3 => navigate tab
"SHIFT + 4 => Open current in new tab
"
"
"NERDTREE
"C to change dir
"m to do various things
"t to open in tab!
"----------- Overview-------------
" <ctrl-y>  copy to filebuffer (~/.vim/.vimbuf)
" <ctrl-p>  paste from filebuffer (~/.vim/.vimbuf)

" <ctrl-l>  search files in subdirectories

" <F2>      go to reference (YouCompleteMe)

" <F5>      run file in python
" <F6>      run file in python3

" <F8>      toggle paste mode

" <F9>      toggle/run Syntastic
" <F10>     toggle YouCompleteMe
" <F12>     go to definition (YouCompleteMe)
"
" ':G' to grep for word under cursor
" ':Grep <pattern>' to grep for pattern
"
" Syntastic and YouCompleteMe must be enabled by uncommenting
"---------------------------------
"
"
"Search and replace
" * -> search under cursor
" Visual mode + // -> search visual selection
" :%s//new-string/g replace all
"
"
" INSTALL LANGUAGE SERVERS LIKE THIS:
" :CocInstall coc-json coc-tsserver coc-flutter coc-scala coc-rust coc-flow
"

set encoding=utf-8
set fileencoding=utf-8  " The encoding written to file
set fileencodings=ucs-bom,utf-8,cp1257,latin1

let mapleader = "|"
let maplocalleader = '|'
set updatetime=1000
set wildignore +=*/node_modules/*
set wildignore +=*/cordova/*

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload && curl -o ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Load plugins
call plug#begin('~/.vim/plugged')

" JAVA
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'lgranie/vim-lsp-java'
" END JAVA
"
"Easy filenavigation
Plug 'scrooloose/nerdtree'

"Plug 'w0rp/ale' " Linting for React, javascript ect eslint
"Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'itchyny/vim-gitbranch'  " Show branch name in status bar
Plug 'itchyny/lightline.vim'  " Configurable status bar
Plug 'airblade/vim-gitgutter'  " Show git line status in gutter
Plug 'farmergreg/vim-lastplace'  " Save cursor/edit position for next time you open vim. TODO Do i need this?
Plug 'chrisbra/Colorizer'
"Plug 'Yggdroot/indentLine' "Show tabs
"Plug 'w0rp/ale'
"Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins', 'for': ['typescript', 'typescript.tsx']}
"Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.tsx']}
"Plug 'ianks/vim-tsx', { 'for': 'typescript.tsx' }
"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'maxmellon/vim-jsx-pretty' "COlorscheme for .jsx and indent
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'leafgarland/typescript-vim'
"Plug 'tpope/vim-fugitive' " git plugin, does not currently work due to SUDO
Plug 'kristijanhusak/vim-js-file-import'
"Plug 'peitalin/vim-jsx-typescript'
Plug 'ctrlpvim/ctrlp.vim'  " Quickly open file from current working dir
"Plug 'chrisbra/csv.vim'  " Csv formatting and coloring
"Plug 'rust-lang/rust.vim'  " Rust support
Plug 'joshdick/onedark.vim' "Colorscheme
Plug 'lifepillar/vim-gruvbox8' "Colorscheme
Plug 'sheerun/vim-polyglot' "Large colorscheme/syntax pack
Plug 'jacoborus/tender.vim'  " Colorscheme
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-liquid'
"Plug 'nanotech/jellybeans.vim' "Colorscheme
"Plug 'tomasr/molokai' "Colorscheme 
Plug 'scrooloose/syntastic', {'on': []}  " Linting, error messages and
"such!!! Pretty useful!
" YouCompleteMe : python3-dev, cmake, vim-nox(vim with python)
"Plug 'Valloric/YouCompleteMe',  {'do': 'python3 ./install.py --ts-completer'}  " Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Autocompletion :CocInstall coc-....  (coc-flutter
"Plug 'rust-lang/rust.vim' 
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'ludovicchabant/vim-gutentags' "Automatically manages tags!!!
"
"LATEX
"jiPlug 'lervag/vimtex'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'drmikehenry/vim-fontsize'
call plug#end()

"LATEX
" Remove the regulare keybinding
"map <S-enter> <nop>
"map <S-space> <nop>
"SNIPPETS
"let g:UltiSnipsExpandTrigger = '<s-space>'
"let g:UltiSnipsJumpForwardTrigger = '<s-space>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-space>'

"LATEX CONFIGS
" RUN BY latexmk -pdf -pvc 
":command Runl :! latexmk -pdf -pvc & disown
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'

" Prettier
"let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Disable YCM on latex files!
":set filetype?
"if &filetype ==# 'tex' || &filetype ==# 'bib'
"    let g:ycm_auto_trigger = 0
"    let s:ycm_enabled = 0
"endif

" END LATEX CONFIGS



" Statusbar config
let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'gitbranch', 'readonly', 'filename' ],
      \             [ 'modified' ]]
      \ } ,
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?" RO ":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?" -- Modified --":&modifiable?"":""}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \ },
      \}

" Override colorscheme jellybeans
"let g:jellybeans_overrides = {
"\   'Todo': {'ctermfg': 'none', 'attr': 'bold'},
"\   'background': {'guibg':'000000'} ,
"\   'LineNr': {'ctermfg': 'White', 'guifg':'ffffff'},
"\   'CursorLineNr': {'guifg':'bbbbbb'},
"\}
"

"TODO what is this?
" To run gitgutter continuously
set updatetime=4000

"TODO do i need this?
" YouCompleteMe
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_python_binary_path = 'python3'
set completeopt-=preview  " Do not show additional info in top preview window
set pumheight=0  " Sets the number of displayed autocomplete suggestions
" let g:ycm_autoclose_preview_window_after_completion = 0
"let s:ycm_loaded = 0
"let s:ycm_enabled = 0
function! YCMToggle()
    if !s:ycm_loaded
        echo "YouCompleteMe Loading..."
        call plug#load('YouCompleteMe')
        let s:ycm_loaded = 1
        redraw
    endif
    if s:ycm_enabled
        echo "YouCompleteMe Disabled"
        let g:ycm_auto_trigger = 0
        let s:ycm_enabled = 0
    else
        echo "YouCompleteMe Enabled"
        let g:ycm_auto_trigger = 1
        let s:ycm_enabled = 1
    endif
endfunction
nnoremap <F10> :call YCMToggle()<CR>
nnoremap <F12> :YcmCompleter GoTo<CR>
nnoremap <F2> :YcmCompleter GoToReferences<CR>


"Think this is what makes it posible to undo even when exiting and coming
"back. TODO do i really want this???
" Create undo dir
if empty(glob('~/.vim/undo'))
  silent !mkdir -p ~/.vim/undo
endif
set undodir=~/.vim/undo
set undofile


"TODO do i need this?
" Set tags for searching after definition
set tags=./tags,tags;$HOME
map <C-F12> :!ctags -R -f ./tags .<CR>

" General stuff
set laststatus=2  " Always show status line
set number
"syntax enable
syntax on
"Colorscheme config
"set backgroundcolor=#1D1F21
colorscheme onedark
"colorscheme gruvbox8
"highlight Normal guibg=#1D1F21
"highlight Normal ctermbg=1D1F21
":let g:gruvbox_contrast_dark='hard'

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set hlsearch
set incsearch

set nobackup
set noswapfile

" Highlight redundant whitespace
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
" Remove background color
" highlight Normal ctermbg=NONE


" System wide copy/paste to .vimbuf
"map <C-y> :w! ~/.vim/.vimbuf<cr>
"map <C-p> :r ~/.vim/.vimbuf<cr>

"To enable the mouse to be used with vim!
":set mouse&
:set mouse=a





":set cursorcolumn
" TODO custom color on 120 column?
:set cursorline
set colorcolumn=120
set ttimeoutlen=10

:set ignorecase
:set smartcase
" Default Colors for CursorLine
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
"augroup myCmds
"au!
"autocmd VimEnter * silent !echo -ne "\e[2 q"
"augroup END
" Page-up/down only moves half a page
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>
nnoremap <S-k> 15kzz
nnoremap <S-j> 15jzz
vnoremap <S-k> 15kzz
vnoremap <S-j> 15jzz
    
nnoremap <S-h> 5h
nnoremap <S-l> 5l
vnoremap <S-h> 5h
vnoremap <S-l> 5l

noremap <C-v> "+p
noremap <C-c> "+y
"# Requires gvim 
" change tabs with CTRL
":nnoremap <leader>1 1gt
":nnoremap <leader>2 2gt
":nnoremap <leader>3 3gt
":nnoremap <leader>4 4gt
":nnoremap <leader>5 5gt
":nnoremap <leader>6 6gt
":nnoremap <leader>7 7gt
":nnoremap <leader>8 8gt
":nnoremap <leader>9 9gt
" SHITFT 1/2/3/4
:nnoremap ! 1gt
:nnoremap " 2gt
:nnoremap # 3gt
:nnoremap ¤ 4gt
:nnoremap % 5gt
:nnoremap & 6gt
:nnoremap = :silent !gvim %:p<CR>
:nnoremap ^X@s1 1gt
:nnoremap ^X@s2 2gt
:nnoremap <T-1> 1gt
:nnoremap <T-2> 2gt
" Search for visually selected 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
":nnoremap <C-Q> 1gt
":nnoremap <C-W> 2gt
":nnoremap <C-E> 3gt
":nnoremap <C-R> 4gt

":nnoremap Q :tab sp<CR>
":nnoremap W <C-w>v
":nnoremap W :silent !gvim %:p<CR>

" Makes the NERDTree root directory be the one found below
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let g:rooter_patterns = [ 'src/','.git/']
let g:rooter_silent_chdir = 1
let NERDTreeMapJumpFirstChild = ''
let NERDTreeMapJumpLastChild = ''

":command! t tab sp
":command! v 

nnoremap gf <C-w>vgf

let g:ctrlp_max_files=5000

" lines relative numbers
set relativenumber
function MyNerdToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

nnoremap <Tab> :call MyNerdToggle()<CR>


"map <Tab> :NERDTreeToggle :NERDTreeFind<CR>
:highlight LineNr ctermfg=white
" Make normal text white
highlight Normal ctermfg=white


"FLUTTER FORMATING KEY

"function! SaveAndFormat()
"    :w
"    :! flutter format %
"endfunction
"nnoremap <C-s> :call SaveAndFormat()<CR>

" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon

" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

:nnoremap <C-s> :w <CR>

let NERDTreeMapActivateNode= '<space>'
let NERDTreeShowLineNumbers=1 "Numberlines on nerdtree
autocmd FileType nerdtree setlocal relativenumber "numberline shown in relative numbers



"go to definition in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"go to definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" TODO
" Tab in write mode (to accept autocomplete)
"
" LAST TO GET DONE
"Remove YCM from tex files!
"autocmd FileType tex let g:ycm_auto_trigger = 0
"autocmd FileType tex let s:ycm_enabled = 0

" INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL
" INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL
" INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL
" INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL INSTALL

" PlugInstall
" download gvim (to get clipboard funcionality)

" YOUCOMPLETEME:
" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --all


"JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK
"JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK
"JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK
"JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK JUNK
"
" Grep to quickfix window in current git repository or folder
" ':G' to grep for word under cursor
" ':Grep <pattern>' to grep for pattern
function! g:Grep(string)
    silent! execute 'grep! -e '.a:string.' $(git rev-parse --show-toplevel \|\| echo ".") -rnI' | copen | execute 'silent /'.a:string | execute ':redraw!'
endfunction
command! G call Grep(expand("<cword>"))
command! -nargs=+ Grep call Grep("<args>")
"TODO do i need this?
"" Syntastic
" Checkers must be installed. Run: pip3 install --user flake8 mypy

"BEGIN FONT CHANGE GVIM
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

"    function! FontSizePlus ()
"      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
"      let l:gf_size_whole = l:gf_size_whole + 1
"      let l:new_font_size = ' '.l:gf_size_whole
"      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
"    endfunction
"
"    function! FontSizeMinus ()
"      let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
"      let l:gf_size_whole = l:gf_size_whole - 1
"      let l:new_font_size = ' '.l:gf_size_whole
"      let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
"    endfunction
"
"
if has("gui_running")
  let s:vmode      = "gui"
  let s:background = "#1d1f21"
  let s:foreground = "#c5c8c6"
endif

if has("gui_running")
    nmap + <leader><leader>+
    nmap - <leader><leader>-
endif
" ENDGVIM
" Various configurable settings
let g:syntastic_python_checkers = ['mypy', 'flake7']
"let g:syntastic_python_checkers = ['mypy']
"let g:syntastic_python_checkers = ['flake7']
"let g:syntastic_python_mypy_args = "--strict --cache-dir=/dev/null --follow-imports silent --allow-untyped-decorators"
let g:syntastic_python_mypy_args = "--strict --follow-imports silent --allow-untyped-decorators"
"let g:syntastic_python_mypy_args = "--cache-dir=/dev/null --follow-imports silent --ignore-missing-imports"
"let g:syntastic_python_mypy_args = "--cache-dir=/dev/null"
" Syntastic
" Checkers must be installed. Run: pip3 install --user flake8 mypy



"TODO do i need this?
let s:syntastic_loaded = -1
let s:syntastic_enabled = -1
function! SyntasticToggle()
    if !s:syntastic_loaded
        call plug#load('syntastic')
        let s:syntastic_loaded = 0
    endif
    if s:syntastic_enabled
        echo "Syntastic Disabled"
        let g:syntastic_mode_map = {"mode": "passive"}
        call SyntasticReset()
        let s:syntastic_enabled = -1
    else
        let g:syntastic_mode_map = {"mode": "active"}
        call SyntasticCheck()
        let s:syntastic_enabled = 0
        echo "Syntastic Enabled"
    endif
endfunction
nnoremap <F8> :call SyntasticToggle()<CR>
" Handle special file types
filetype plugin on
autocmd BufRead,BufNewFile Jenkinsfile* setfiletype groovy
autocmd BufRead,BufNewFile *.pyi setfiletype python
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" Run file in python
" TODO do i need this?
"nnoremap <F5> :w !python<CR>
"nnoremap <F6> :w !python3<CR>


" Toggle Paste Mode / Copy Mode
" Remove all gutters and enable paste mode
" TODO do i need this?
"let s:paste_enabled = 0
"let s:original_colorscheme = g:colors_name
"function! TogglePasteMode()
"    if !s:paste_enabled
"        echo "Paste Mode Enabled"
"        set nonu
"        GitGutterDisable
"        set paste
"        colorscheme desert
"        let s:paste_enabled = 1
"    else
"        echo "Paste Mode Disabled"
"        set nu
"        GitGutterEnable
"        set nopaste
"        execute 'colorscheme '.s:original_colorscheme
"        let s:paste_enabled = 0
"    endif
"endfunction
"nnoremap <F8> :call TogglePasteMode()<CR>

"COC CONFIG


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"COC CONFIG
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
":let g:colorizer_auto_color = 1
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"let g:coc_node_path = ".nvm/versions/node/v12.18.0/bin/node"
