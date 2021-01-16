set nocompatible
filetype off
filetype plugin indent on
set encoding=utf-8
set autoindent smartindent
" show line number
set number
set relativenumber

set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
syntax on
set cursorline
set shiftround
set splitbelow splitright
" share clipboard with system
set clipboard=unnamed

" set js indent
autocmd Filetype jade set sw=2 ts=2 sts=2 expandtab
autocmd Filetype javascript set sw=2 ts=2 sts=2 expandtab

" fix some Unicode word
set ambiwidth=double

" for insert mode
inoremap <S-Tab> <C-d>

" fix macos backspace
set backspace=indent,eol,start

" spell check
set spell spelllang=en_us
autocmd FileType gitcommit,markdown setlocal spell

" set column at 80
set colorcolumn=80

" show space in line end
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" Remove extra trailling spaces
autocmd BufWritePre * :%s/\s\+$//e

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
" Highlight the occurance of current word, use following command to select color
" :so $VIMRUNTIME/syntax/hitest.vim
autocmd CursorMoved * exe printf('match VisualNOS /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" show status bar
set laststatus=2

" create file in current dir
set autochdir

" set the runtime path to include vim-plug and initialize
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" auto closing of quotes
Plug 'Raimondi/delimitMate'
" ctrlp search files
Plug 'ctrlpvim/ctrlp.vim'
" cntlP find function
Plug 'tacahiroy/ctrlp-funky'
" vim theme
Plug 'nanotech/jellybeans.vim'
" airline status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
" show indent line
Plug 'Yggdroot/indentLine'
" git blame
Plug 'tpope/vim-fugitive'
" handling quote and closing
Plug 'tpope/vim-surround'
" make repeat do more things
Plug 'tpope/vim-repeat'
call plug#end()

" vim theme
colorscheme jellybeans

" airline setting
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline_detect_spell=0

" lsp auto input by tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" lsp shortcut mapping
nnoremap <buffer> gd :<C-u>LspDefinition<CR>
nnoremap <buffer> gD :<C-u>LspReferences<CR>
nnoremap <buffer> gn :<C-u>LspRename<CR>

" lsp show message
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_diagnostics_echo_delay=200

" format file when save by lsp
autocmd BufWritePre <buffer> LspDocumentFormatSync

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

" indent line show leading space
let g:indentLine_leadingSpaceChar='-'
let g:indentLine_leadingSpaceEnabled='1'
let g:indentLine_fileTypeExclude = ['json', 'text', 'markdown']
