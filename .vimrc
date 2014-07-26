set rtp+=/home/darren/.local/go/misc/vim
"filetype plugin indent on
syntax on

autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala

" Disable valadoc syntax highlight
"let vala_ignore_valadoc = 1

" Enable comment strings
let vala_comment_strings = 1

" Highlight space errors
"let vala_space_errors = 1
" Disable trailing space errors
"let vala_no_trail_space_error = 1
" Disable space-tab-space errors
"let vala_no_tab_space_error = 1

" Minimum lines used for comment syncing (default 50)
"let vala_minlines = 120

set sw=4
set bs=2                    " allow backspacing over everything in insert mode
set autoindent                      " always set autoindenting on
set cinkeys=0{,0},:,0#,!,!^F
set smartindent
set ignorecase
set smartcase
set ts=4
set shiftround
set shiftwidth=4
set expandtab
set showcmd
set incsearch
set scrolloff=4
set wildmode=list:longest,full
set showmatch matchtime=3
set diffopt+=iwhite
set history=50              " keep 50 lines of command line history
set ruler                   " show the cursor position all the time

nmap :W :w
nmap :X :x
nmap :Q :q

" Paste toggle
nnoremap \tp :set invpaste paste?<CR>
nmap <F4> \tp
imap <F4> <C-O>\tp
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

"set mouse=a
"set spell
set switchbuf=usetab,newtab

map <Leader>n <plug>NERDTreeTabsToggle<CR>

call pathogen#infect()

let g:NERDTreeWinSize = 20

set hlsearch
set incsearch

nmap <F8> :w<CR>:!py.test --pdb<CR>
set colorcolumn=80
