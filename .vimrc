execute pathogen#infect()
syntax on
filetype plugin indent on
let NERDTreeShowHidden=1

set noswapfile
set nobackup
set wildmenu
set wildmode=list:longest

let mapleader = ";"
map <leader>f :NERDTreeToggle<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt

nnoremap <leader>w :q<CR>
nnoremap <leader>e :tabnew<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>n :nohlsearch<CR>
nnoremap <leader>a :split<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>- :res -3<CR>
nnoremap <leader>= :res +3<CR>
nnoremap <leader>, :vert res -3<CR>
nnoremap <leader>. :vert res +3<CR>
nnoremap <leader>; :bnext<CR>

inoremap <leader>h <esc>:tabprevious<CR>
inoremap <leader>l <esc>:tabnext<CR>
inoremap <leader>s <esc>:w<CR>

nnoremap YY "+yy
nnoremap DD "+dd
nnoremap <c-j> <c-e>j
nnoremap <c-k> <c-y>k
inoremap jj <esc>l
vnoremap YY "+y
nnoremap PP "+p
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
set number
:colorscheme zenburn


set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2

