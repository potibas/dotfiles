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

call plug#end()

" Behaviour
let mapleader=','
set hidden
set lazyredraw nowrap noerrorbells mouse=a
set noswapfile nobackup nowritebackup
set showmatch matchtime=1 updatetime=50 timeoutlen=400 ttimeoutlen=0
set shiftwidth=2 softtabstop=2 tabstop=2
set expandtab autoindent smartindent shiftround
set nopaste pastetoggle=<F2>

" Shortcuts
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>x :bd<cr>

" Home/End
nmap H 0
nmap L $

" Switch to alternate file
nmap <leader><leader> <C-^>

" Expand current file's directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Jump around quickfix window
set <S-F4>=[1;2S
nmap <silent> <F4> :cnext<cr>
nmap <silent> <S-F4> :cprev<cr>

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
