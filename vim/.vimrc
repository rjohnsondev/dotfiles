set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

set ts=4
set sts=4
set sw=4
set expandtab

" case insensitive searching...
set ignorecase
set smartcase
"
" allow files to override defaults
set modeline

" I want line numbers
set nu

" give me auto indenting even for files vi does not recognize
set ai
set smartindent

set foldmethod=marker

set bdir=/home/richard/.vimtmp
set dir=/home/richard/.vimtmp
set undodir=/home/richard/.vimtmp
set undofile

" display char information in bottom right.
set ruler
set laststatus=2

" Use incremental searching
set incsearch

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3
set scrolljump=5

" Always.
set enc=utf-8
syntax on

" make backspace work correctly.
set backspace=2

" for filename tab completion
set wildmode=list:longest,full

" some tab customisations...
map <C-l> :tabnext<CR>
map <C-h> :tabprev<CR>
map <C-t> :tabnew<CR>
" map <C-e> :tabnew<CR>:NERDTree<CR>

if has("gui_running")
    " kill tabs
    set guioptions-=T
    " kill menu
    set guioptions-=m
    "set gfn=Consolas:h10:cANSI
    set guifont=Consolas
    " consolas looks better with an extra pixel between lines
    set linespace=1
else
    " force 256 color
    " let &t_Co=256
    set mouse=a
    set ttymouse=xterm2
endif


"""""""""""""""""""""""""""""""""""""
" https://github.com/gmarik/Vundle.vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'motus/pig.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'guns/vim-slamhound'
Plugin 'wincent/Command-T'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'dbext.vim'
" Git plugin not hosted on GitHub
Plugin 'go', {'pinned': 1}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Bundle customisations
"
if has("gui_running")
    "colorscheme github
    colorscheme desertEx
endif

map <C-e> :NERDTreeToggle<CR>
map <C-space> :CommandT<CR>
autocmd FileType clojure vmap <ENTER> :Eval<CR>
autocmd FileType clojure nmap <C-ENTER> :%Eval<CR>
au FileType javascript setl sw=2 sts=2 ts=2 et
au FileType html setl sw=2 sts=2 ts=2 et
autocmd FileType sql nmap <ENTER> :DBExecSQLUnderCursor<CR>
autocmd FileType sql vmap <ENTER> :DBExecRangeSQL<CR>

let g:golang_goroot = "/home/richard/go/"

let g:syntastic_java_checkstyle_classpath = "/home/richard/classpath/checkstyle-6.0/checkstyle-6.0-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/home/richard/classpath/checkstyle-6.0/sun_checks.xml"
let g:syntastic_java_checkers=['checkstyle']
let g:syntastic_python_checkers=['flake8']

let $PATH .= ":/home/richard/go/bin:/home/richard/apache-maven-3.1.0/bin"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Databases
let g:dbext_default_profile_psql_local = 'type=PGSQL:user=account:host=127.0.0.1'
" :DBSetOption user|passwd|dsnname|srvname|dbname|host|port|...=<value>

