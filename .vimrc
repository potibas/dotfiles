set nocompatible

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rakr/vim-one'

call plug#end()

" Behaviour
let mapleader=','
set hidden
set lazyredraw nowrap noerrorbells mouse=a
set noswapfile nobackup nowritebackup
set showmatch matchtime=1 updatetime=50 timeoutlen=400 ttimeoutlen=0
set shiftwidth=2 softtabstop=2 tabstop=2
set expandtab autoindent smartindent
set nopaste pastetoggle=<F2>

" Persistent undo
if !isdirectory($HOME."/.vim/undo")
  call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undofile undodir=~/.vim/undo

" Appearance
set scrolloff=5
set number relativenumber cursorline
set showcmd cmdheight=1 laststatus=2
set signcolumn=yes

" Disable Background Color Erase (BCE)
set ttyfast t_ut=

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark
let g:one_allow_italics = 1
silent! color one

" Shortcuts
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>x :bd<cr>

" Home/End
nmap H 0
nmap L $

" Make Y consistent with C and D.
nnoremap Y y$

" Make j/k movement more natural when text is wrapped
nnoremap j gj
nnoremap k gk

" Switch to alternate file
nmap <leader><leader> <C-^>

" Expand current file's directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Jump around quickfix window
set <S-F4>=[1;2S
nmap <silent> <F4> :cnext<cr>
nmap <silent> <S-F4> :cprev<cr>

" Toggle line-wrapping
nmap <silent> <F6> :set wrap!<cr>
imap <silent> <F6> <C-O>:set wrap!<cr>

" Search history with C-P/C-N
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

" Window navigation and resizing
set splitright
nmap vv <C-w>v
nmap vh <C-w>s

" Quick edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC \| echo "Vim configuration reloaded"<cr>
