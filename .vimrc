set nocompatible
set encoding=utf-8
set noerrorbells
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete'

call vundle#end()
filetype plugin indent on 

" Neocomplete settings
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_select = 1
" Make TAB complete work the way I want
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Random stuff
set autoindent
set bs=2
" set cinkeys=0{,0},:,0#,!^F
set diffopt+=iwhite
set expandtab
set history=50
set hlsearch
set ignorecase
set incsearch
set ruler
set scrolloff=2
set shiftround
set showcmd
set showmatch matchtime=3
set smartcase
set smartindent
set sw=4
set ts=4
set wildmode=list:longest,full

nmap :W :w
nmap :X :x
nmap :Q :q

" Paste toggle
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
nmap <F8> :GoBuild<CR>
nmap <F7> :GoTest<CR>
set pastetoggle=<F4>

highlight Search term=reverse  ctermbg=4 ctermfg=3
highlight Comment ctermfg=darkcyan

map <C-j> <C-w><Down><C-w>_
map <C-k> <C-w><Up><C-w>_
map <C-;> <C-w>=

nmap <C-Left> :tabp<CR>
nmap <C-Right> :tabn<CR>
nmap <C-h> :tabp<CR>
nmap <C-l> :tabn<CR>
nmap <C-n> :Texplore<CR>
nmap <M-Left> :tabp<CR>
nmap <M-Right> :tabn<CR>

set switchbuf=usetab,newtab

nmap <F8> :w<CR>:GoBuild<CR>
nmap <F9> :w<CR>:GoTest<CR>

let @s='/void set4Y3jpncwRETURN/set3xiwithjoreturn this;'

autocmd FileType javascript setlocal sw=2 ts=2
autocmd FileType yaml setlocal sw=2 ts=2

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:go_fmt_command = "goimports"
