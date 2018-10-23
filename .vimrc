set nocompatible
set nobackup nowritebackup noswapfile

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Utilities
Plug 'scrooloose/nerdtree'
Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && { make clean; ruby extconf.rb && make; }' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Language support
Plug 'elixir-editors/vim-elixir'

" Colorschemes
Plug 'Lokaltog/vim-distinguished'
Plug 'jpo/vim-railscasts-theme'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()

" Basic config
set history=10000
set ignorecase smartcase
set backspace=indent,eol,start
set showcmd cmdheight=1
set number

" Indentation
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab autoindent

" Searching
set showmatch incsearch hlsearch
nmap <space> :nohlsearch<cr>

" Appearance
set scrolloff=4
set cursorline

" Colors for non-GUI
if !has("gui_running")
    syntax on
    set t_Co=256
    set background=dark
    silent! color distinguished " might not be there yet
    highlight clear CursorLine
    " highlight CursorLine ctermfg=231 ctermbg=237 guibg=Grey40
    silent! highlight CursorLine ctermbg=237 guibg=Grey40
end

" Shortcuts
let mapleader = ","

" File and window navigation
set wildignore+=*.o,*.obj,.git,vendor
let g:NERDTreeIgnore=['\~$\', 'vendor']
let g:CommandTFileScanner='find'
map <leader>f :CommandT<cr>
map <leader>z :NERDTreeToggle<cr>
nnoremap <leader><leader> <c-^>

" Common shortcuts
map <leader>w :w<cr>
map <leader>q :q<cr>
map <leader>n :set invnumber<cr>

" Quick edit vim configuration:
map <leader>v :e ~/.vimrc<cr>
map <leader>V :e ~/.gvimrc<cr>
map <leader>R :w \| :so %<cr>

augroup vimrc
    autocmd!
    
    " Jump to last edit when opening file
    autocmd BufReadPost *
        \ if line("\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

augroup END
