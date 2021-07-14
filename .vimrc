" The basics
set nocompatible
set nobackup nowritebackup noswapfile

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language Support
Plug 'elixir-editors/vim-elixir'

" Colorschemes
Plug 'Lokaltog/vim-distinguished'
Plug 'KeitaNakamura/neodark.vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

" Appearance
syntax on

set scrolloff=4
set number cursorline
set showcmd cmdheight=1
set termguicolors background=dark t_Co=256
silent! color jellybeans

" No beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Shortcuts
let mapleader = ","

" Fast switch to the last edited file with ,,
nnoremap <leader><leader> <c-^>

" Indentation
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab autoindent

" Searching
set showmatch incsearch hlsearch
nmap <space> :nohlsearch<cr>

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <C-f> :Rg<CR>

" Current file's directory with %%
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Search history with C-P/C-N
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

" Quick edit vim configuration:
map <leader>v :e ~/.vimrc<cr>
map <leader>V :e ~/.gvimrc<cr>
map <leader>R :w \| :so %<cr>

augroup vimrc
    autocmd!

    " Jump to last edit when opening file
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

augroup END
