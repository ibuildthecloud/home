" Plugins
set nocompatible
set encoding=utf-8
filetype plugin on
syntax on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ziglang/zig.vim'
Plugin 'jjo/vim-cue'
Plugin 'jasontbradshaw/pigeon.vim'

call vundle#end()
filetype plugin indent on 

" Make cue detect work, no clue why it doesn't work by default
au BufRead,BufNewFile *.cue setfiletype cue
au BufRead,BufNewFile Acornfile setfiletype cue

" Random settings
autocmd FileType javascript setlocal sw=2 ts=2
autocmd FileType yaml setlocal sw=2 ts=2

highlight Comment ctermfg=darkcyan
highlight Search term=reverse  ctermbg=4 ctermfg=3

let g:go_fmt_command = "goimports"
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

map <C-;> <C-w>=
map <C-j> <C-w><Down><C-w>_
map <C-k> <C-w><Up><C-w>_

nmap <C-h> :tabp<CR>
nmap <C-Left> :tabp<CR>
nmap <C-l> :tabn<CR>
nmap <C-n> :Texplore<CR>
nmap <C-Right> :tabn<CR>
nmap <M-Left> :tabp<CR>
nmap <M-Right> :tabn<CR>
nmap :Q :q
nmap :W :w
nmap :X :x

set autoindent
set backupdir=~/.vim/_backup/    " where to put backup files.
set bs=2
set diffopt+=iwhite
set directory=~/.vim/_temp/      " where to put swap files.
set expandtab
set history=50
set hlsearch
set ignorecase
set incsearch
set noerrorbells
set ruler
set scrolloff=2
set shiftround
set showmatch matchtime=3
set smartcase
set smartindent
set sw=4
set switchbuf=usetab,newtab
set ts=4
set wildmode=list:longest,full

" allow undo history to persist after closing buffer
if has('persistent_undo')
  set undodir=~/.vim/_undo
  set undofile
end
