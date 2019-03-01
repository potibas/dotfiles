set nocompatible

" Plugins
call plug#begin('~/.config/nvim/plugged')

  " Color themes
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'morhetz/gruvbox'
  Plug 'arcticicestudio/nord-vim'
  Plug 'rakr/vim-one'
  Plug 'mhartington/oceanic-next'

  " Essential plugins
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'cloudhead/neovim-fuzzy'

  " Language-specific utilities
  Plug 'mhinz/vim-mix-format'
  Plug 'elixir-editors/vim-elixir'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'nathangrigg/vim-beancount'

  " Seamless window navigation between vim & tmux
  Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" My settings
set history=10000
set backspace=indent,eol,start
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent
set nobackup nowritebackup noswapfile
set showmatch incsearch hlsearch ignorecase smartcase
set encoding=utf-8
set showcmd cmdheight=1
set number relativenumber
set noautochdir
set hidden
let g:mapleader=','

" Shortcuts
map <leader>w :w<cr>
map <leader>q :q<cr>
nnoremap L $
nnoremap H _
map <cr> :nohlsearch<cr>
map <space> :nohlsearch<cr>

" Window navigation
nnoremap <leader><leader> <c-^>
nnoremap <leader>f :FuzzyOpen<cr>

" Move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Expand %% to the current file's directory
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" Quick edit vim configuration:
map <leader>rv :e ~/.config/nvim/init.vim<cr>
map <leader>rr :w \| :so ~/.config/nvim/init.vim \| :nohlsearch<cr>

" Don't open help when I accidentaly hit F1
nmap <F1> <nop>
imap <F1> <nop>

" Switch colorschemes
nmap <F3> :color OceanicNext<cr>
nmap <F4> :color palenight<cr>
nmap <F5> :color neodark<cr>
nmap <F6> :color ayu<cr>
nmap <F7> :color gruvbox<cr>
nmap <F8> :color one<cr>
nmap <F9> :color nord<cr>

" Appearance
syntax on
set background=dark
set termguicolors
set scrolloff=4
set cursorline
color one

augroup vimrc
  autocmd!

  " Jump to last cursor position unless it's invalid or in an event handler
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Elixir-specific mappings
  au BufRead,BufNewFile *.ex,*.exs,*.eex nmap <leader>. :w \| :MixFormat<cr>
  au BufRead,BufNewFile *.ex,*.exs,*.eex nmap <leader>a :w \| :!mix test<cr>
  au BufRead,BufNewFile *.ex,*.exs,*.eex nmap <leader>t :w \| :!mix test %<cr>

  " Prettier
  au Filetype javascript,javascript.jsx nmap <silent> <leader>. :Prettier<cr>

  " Per-language tab settings
  au Filetype php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  au Filetype sql setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  au Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  au FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

  " Don't wrap CSV files
  au BufRead,BufNewFile *.csv set nowrap

  " Edit GZipped files
  au BufReadPre,FileReadPre     *.dia setlocal bin
  au BufReadPost,FileReadPost   *.dia call gzip#read("gzip -dn -S .dia")
  au BufWritePost,FileWritePost *.dia call gzip#write("gzip -S .dia")
  au FileAppendPre              *.dia call gzip#appre("gzip -dn -S .dia")
  au FileAppendPost             *.dia call gzip#write("gzip -S .dia")

  " ============ COLOR CUSTOMIZATIONS ================

  " Comments in italic
  au BufWinEnter,ColorScheme * hi Comment gui=italic cterm=italic

  " Transparent background
  au BufWinEnter,ColorScheme * hi Normal guibg=NONE ctermbg=NONE

  " Trailing whitespace in red
  au BufWinEnter,ColorScheme * hi TrailingWS ctermbg=red ctermfg=red guibg=#990000
  au VimEnter * call matchadd('TrailingWS', '\s\+$', -1)

  " Characters after column 99 in red
  au ColorScheme,BufWinEnter * hi OverLength ctermfg=red guifg=red ctermbg=NONE guibg=NONE
  au VimEnter * call matchadd('OverLength', '\%99v.\+', -1)

  " Underlined yellow search results
  au ColorScheme,BufWinEnter * hi IncSearch
        \ ctermfg=180 ctermbg=16 cterm=underline gui=underline,bold guifg=#e5c07b guibg=#282c384
  au ColorScheme,BufWinEnter * hi Search
        \ ctermfg=180 ctermbg=16 cterm=underline gui=underline guifg=#e5c07b guibg=#282c384

augroup END

" ========= MASTERING VIM TIPS ==========
"
" Use :w!! (quickly) to save a file as sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
