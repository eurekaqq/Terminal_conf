set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Raimondi/delimitMate'

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'tpope/vim-pathogen'
Plugin 'vim-syntastic/syntastic'
" cntlP find function
Plugin 'tacahiroy/ctrlp-funky'
" show indent line
Plugin 'Yggdroot/indentLine'
" auto pep8
Plugin 'tell-k/vim-autopep8'
" git blame
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set autoindent smartindent
set number
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
syntax on

colorscheme molokai

set autoindent
set cindent
set cursorline

" fix some Unicode word
set ambiwidth=double

" for insert mode
inoremap <S-Tab> <C-d>

" fix mac backspace
set backspace=indent,eol,start

" spell check
set spell spelllang=en_us
autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile *.py setlocal spell

" set column at 80
set colorcolumn=80

" show space in line end
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:syntastic_python_checkers = ['pylint']
set laststatus=2
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

execute pathogen#infect()

" lsp auto input by tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" for search
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" disable backup file
set nowritebackup
set nobackup
set noswapfile

" if line is too long then show it in next line.
" set wrap

" control+p setting
let g:ctrlp_match_window = 'order:ttb,min:8,max:8,results:100'
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil']
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'

" run autopep8 when save
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

