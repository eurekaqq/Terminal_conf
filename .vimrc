set nocompatible
filetype off     
filetype plugin indent on
set encoding=utf-8
set autoindent smartindent
set number
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
syntax on
set cursorline
set shiftround
set splitbelow splitright

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

" disable backup file
set nowritebackup
set nobackup
set noswapfile

" for search
set incsearch
set ignorecase
set smartcase
set hlsearch
" double tap esc to disable highlight
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR> 

" show status bar
set laststatus=2

" set the runtime path to include Vundle and initialize
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" auto closing of quotes
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
" cntlP find function
Plug 'tacahiroy/ctrlp-funky'
" show indent line
Plug 'Yggdroot/indentLine'
" auto pep8
Plug 'tell-k/vim-autopep8'
" git blame
Plug 'tpope/vim-fugitive'
" handling quote and closing 
Plug 'tpope/vim-surround'
" make repeat do more things
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
call plug#end()

" vim theme
colorscheme molokai

" airline theme
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1

" lsp auto input by tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" lsp shortcut mapping
nnoremap <buffer> gd :<C-u>LspDefinition<CR>
nnoremap <buffer> gD :<C-u>LspReferences<CR>
nnoremap <buffer> <F2> :<C-u>LspRename<CR>

" control+p setting
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_match_window = 'order:ttb,min:8,max:8,results:100'
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil']
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'

" run autopep8 when save
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

" indent line show leading space
let g:indentLine_leadingSpaceChar='-'
let g:indentLine_leadingSpaceEnabled='1'
