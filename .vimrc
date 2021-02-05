set nocompatible
filetype off
filetype plugin indent on
set encoding=utf-8
set autoindent smartindent
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" set js indent
autocmd Filetype jade set sw=2 ts=2 sts=2 expandtab
autocmd Filetype javascript set sw=2 ts=2 sts=2 expandtab

" show line number
set number
set relativenumber

syntax on
set cursorline
set shiftround
set splitbelow splitright
" share clipboard with system
set clipboard=unnamed

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

" delete without overwrite clipboard
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

" swap two line use Ctrl + jk
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

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
" cntlP search function
Plug 'tacahiroy/ctrlp-funky'
" show indent line
Plug 'Yggdroot/indentLine'
" git blame
Plug 'tpope/vim-fugitive'
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
let g:airline_detect_spell = 0
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ':%2v'])

" lsp auto input by tab
let g:asyncomplete_auto_popup = 0
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" lsp shortcut mapping
nnoremap <buffer> gd :<C-u>LspDefinition<CR>
nnoremap <buffer> gD :<C-u>LspReferences<CR>
command Rn LspRename
command Lne LspNextError
command Lnw LspNextWarning

" lsp preview window
let g:lsp_preview_max_width = 60
let g:lsp_preview_max_height = 8

" lsp show message
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 175

" format file when save by lsp
autocmd BufWritePre <buffer>,*.py LspDocumentFormatSync

" control+p setting
" controlP open file in new tab
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|)$',
    \ 'file': '\v\.(exe|so|dll|zip|pyc|DS_Store)$',
    \ }
let g:ctrlp_match_window = 'order:ttb,min:8,max:8,results:100'
let g:ctrlp_show_hidden = 1
let g:ctrlp_lazy_update = 200
let g:ctrlp_open_multiple_files = 'tj'
let g:ctrlp_types = ['fil']
" enable ctrlP extension
let g:ctrlp_extensions = ['funky']
" ctrlP funky
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_use_cache = 1

" indent line show leading space
let g:indentLine_leadingSpaceChar = '-'
let g:indentLine_leadingSpaceEnabled = '1'
let g:indentLine_fileTypeExclude = ['json', 'text', 'markdown']
