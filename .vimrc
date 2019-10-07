set nocompatible

" Basic config
set nobackup nowritebackup noswapfile
set history=10000
set ignorecase smartcase
set backspace=indent,eol,start
set showcmd cmdheight=1
set number relativenumber
set scrolloff=4 cursorline

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Utilities
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && { make clean; ruby extconf.rb && make; }' }
Plug 'tpope/vim-surround'

" Colorschemes
Plug 'KeitaNakamura/neodark.vim'

call plug#end()

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

" File and window navigation
set wildignore+=*.o,*.obj,.git,*/vendor
let g:CommandTFileScanner='find'
map <leader>f :CommandT<cr>
map <leader>z :NERDTreeToggle<cr>
nnoremap <leader><leader> <c-^>

