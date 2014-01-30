set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set ts=4
set sw=4
set expandtab
" set co=125
" set lines=35

" case insensitive searching...
set ignorecase
set smartcase

" I want line numbers
set nu

" give me auto indenting even for files vi does not recognize
set ai
set smartindent

set foldmethod=marker

" maximize me
" au GUIEnter * simalt ~x

set bdir=/home/richard/.vimtmp
set dir=/home/richard/.vimtmp

" display char information in bottom right.
set ruler
set laststatus=2

" Use incremental searching
set incsearch

" Do not highlight search results
"set nohlsearch

set scrolljump=5

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3

" some tab customisations...
map <C-l> :tabnext<CR>
map <C-h> :tabprev<CR>
map <C-t> :tabnew<CR>
" map <C-e> :tabnew<CR>:NERDTree<CR>
map <C-e> :NERDTreeToggle<CR>
map <C-space> :CommandT<CR>


set guioptions-=T
"set gfn=Consolas:h10:cANSI
set guioptions-=m

set undodir=/home/richard/.vimtmp
set undofile

set enc=utf-8

set modeline
syntax on
filetype indent plugin on

set mouse=a
set ttymouse=xterm2

execute pathogen#infect()

"let &t_Co=256
if has("gui_running")
    colorscheme github
endif

" for filename completion
set wildmode=longest,list

set backspace=2
set guifont=Consolas


"autocmd FileType go compiler golang
"autocmd FileType python compiler pylint

let g:golang_goroot = "/home/richard/go/"
set linespace=1

let g:syntastic_java_checkstyle_classpath = "/home/richard/classpath/checkstyle-5.6/checkstyle-5.6-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/home/richard/classpath/checkstyle-5.6/sun_checks.xml"
let g:syntastic_java_checkers=['checkstyle']
let g:syntastic_python_checkers=['flake8']

let $PATH .= ":/home/richard/go/bin:/home/richard/apache-maven-3.1.0/bin"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
