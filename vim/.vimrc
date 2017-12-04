set nocompatible
"source $VIMRUNTIME/mswin.vim
"behave mswin

if has('nvim')
    set termguicolors
    let $COLORTERM= "gnome-terminal"
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

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
"set ruler
set laststatus=2

" Use incremental searching
set incsearch

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=3
set scrolljump=5

" highlight my search results plz
set hlsearch

" Always.
set enc=utf-8
syntax on

" make backspace work correctly.
set backspace=2

" I want to switch buffers without saving.
set hidden

" for filename tab completion
set wildmode=list:longest,full

" make yank more consistent
nnoremap Y y$

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
    set guifont=Consolas\ 12
    " consolas looks better with an extra pixel between lines
    set linespace=1
else
    " force 256 color
    "let &t_Co=256
    set mouse=a
    if !has('nvim')
        set ttymouse=xterm2
    endif
endif


"""""""""""""""""""""""""""""""""""""
" https://github.com/gmarik/Vundle.vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#rc('~/.config/nvim/bundle')

let g:ale_emit_conflict_warnings = 0

call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'flazz/vim-colorschemes'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'motus/pig.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'guns/vim-slamhound'
Plugin 'derekwyatt/vim-scala.git'
Plugin 'rodjek/vim-puppet'
Plugin 'markcornick/vim-terraform'
Plugin 'dag/vim2hs'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
"Plugin 'ervandew/supertab'
" Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/vimproc.vim'
Plugin 'godlygeek/tabular'
"Plugin 'junegunn/vim-easy-align'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'guns/vim-clojure-highlight'
Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'othree/html5.vim'
"Plugin 'wincent/command-t'
"Plugin 'wincent/Command-T'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-scripts/paredit.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'venantius/vim-cljfmt'
Plugin 'dbext.vim'
Plugin 'pearofducks/ansible-vim'
" Git plugin not hosted on GitHub
"Plugin 'go', {'pinned': 1}

" All of your Plugins must be added before the following line
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'
" Plugin 'lambdatoast/elm.vim.git'
Plugin 'ElmCast/elm-vim'
Plugin 'purescript-contrib/purescript-vim'
Plugin 'FrigoEU/psc-ide-vim'
Plugin 'elzr/vim-json'

call vundle#end()            " required
filetype plugin indent on    " required

"
" Bundle customisations
"
"if has("gui_running")
    "colorscheme github
    "colorscheme solarized
    colorscheme desertEx
"endif

let g:rainbow_active=1

map <C-e> :NERDTreeToggle<CR>
function! SetClojureShortcuts()
    if @% =~ '.*test.clj'
        " note the set filetype to re-apply syntax highlighting
        nmap <C-ENTER> :w<CR> :RunTests<CR> :set filetype=clojure<CR>
    else
        nmap <C-ENTER> :%Eval<CR>
    endif
endfunction
" autocmd BufEnter *.clj call SetClojureShortcuts()
autocmd FileType clojure vmap <ENTER> :Eval<CR>
au FileType javascript setl sw=2 sts=2 ts=2 et
au FileType html setl sw=2 sts=2 ts=2 et
" au FileType java setl sw=2 sts=2 ts=2 et
autocmd FileType sql nmap <C-ENTER> :%DBExecRangeSQL<CR>
autocmd FileType sql nmap <ENTER> :DBExecSQLUnderCursor<CR>
autocmd FileType sql vmap <ENTER> :DBExecRangeSQL<CR>

let g:haskell_multiline_strings = 1

let g:golang_goroot = "/home/richard/go/"

let g:syntastic_disabled_filetypes=['python', 'scala', 'ansible', 'css', 'elm', 'go', 'haskell', 'javascript', 'kotlin', 'markdown', 'php', 'rst', 'sql', 'typescript', 'xml', 'xhtml', 'yaml']

let g:syntastic_java_checkstyle_classpath = "/home/richard/classpath/checkstyle-6.19-all.jar"
let g:syntastic_java_checkstyle_conf_file = "/home/richard/classpath/sun_checks.xml"
" let g:syntastic_java_checkstyle_conf_file = "checkstyle.xml"
let g:syntastic_java_maven_executable = "/home/richard/apache-maven-3.3.9/bin/mvn"
let g:syntastic_java_checkers=['checkstyle']
" let g:syntastic_python_checkers=['flake8']

let $PATH .= ":/home/richard/go/bin:/home/richard/apache-maven-3.1.0/bin"

" Databases
let g:dbext_default_profile_psql_local = 'type=PGSQL:user=account:host=localhost'
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=:dbname=temp:extra=-t'
let g:dbext_default_profile_mysql_slave = 'type=MYSQL:host=10.2.46.142:user=richard.johnson:passwd=\&CeS6byNf^A6:dbname=4thand1_ds:extra=-t'
" :DBSetOption user|passwd|dsnname|srvname|dbname|host|port|...=<value>

let g:rainbow_conf = {'guifgs': ['#27408b', '#8b4500', '#2e8b57', '#8b1a1a'] }
"\	'guifgs': ['#3a5fcd', '#cd6600', '#43cd80', '#cd2626'],
"
"let g:lispwords = "POST,GET"

let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^GET', '^POST', '^DELETE', '^PUT', 'go-loop']
let g:clojure_align_multiline_strings = 1
let g:clojure_align_subforms = 1

" make cursor stay put after yank
" vnoremap <expr>y "my\"" . v:register . "y`y"

let g:airline_powerline_fonts = 1
let g:airline_theme='light'

let g:NERDTreeMinimalUI = 1

let g:syntastic_scala_scalastyle_jar = '/home/richard/bin/scalastyle_2.10-0.8.0-batch.jar'
let g:syntastic_scala_scalastyle_config_file = '/home/richard/bin/scalastyle_config.xml'
let g:syntastic_scala_checkers = ['scalastyle']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:psc_ide_syntastic_mode = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

function NERDTreeMyOpenFile(node)
    call a:node.activate({'reuse': 'currenttab', 'where': 'p'})
endfunction
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': 'o', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

let $PATH = $PATH . ':' . expand('~/.cabal/bin')

com! FormatJSON %!python -m json.tool

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" let g:ycm_semantic_triggers = {'haskell' : ['.']}

set clipboard=unnamedplus

let g:ale_linters = {'haskell': ['stack-ghc-mod']}
set lazyredraw
set ttyfast
