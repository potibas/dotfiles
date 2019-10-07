set nocompatible

" Basic config
set nobackup nowritebackup noswapfile
set history=10000
set ignorecase smartcase
set backspace=indent,eol,start
set showcmd cmdheight=1
set number relativenumber
set scrolloff=4 cursorline

" Default indentation
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab autoindent

" Searching
set showmatch incsearch hlsearch
nmap <cr> :nohlsearch<cr>

" Syntax
if !has("gui_running")
    syntax on
    set t_Co=256
    set background=dark
end

" Shortcuts
let mapleader = ","

" Quick edit vim configuration:
map <leader>v :e ~/.vimrc<cr>
map <leader>R :w \| :so %<cr>
