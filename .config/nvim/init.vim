" The Basics
set nocompatible
set history=10000
set backspace=indent,eol,start
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent
set nobackup nowritebackup noswapfile
set encoding=utf-8
set showcmd cmdheight=1
set number relativenumber
set noautochdir
let g:mapleader=','

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

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'
  Plug 'slashmili/alchemist.vim'
    let g:alchemist#elixir_erlang_src = "/usr/local/share/src"
    augroup elixir
       au BufRead,BufNewFile *.ex,*.exs,*.eex nmap <leader>. :w \| :MixFormat<cr>
    augroup END

  " Seamless window navigation between vim & tmux
  Plug 'christoomey/vim-tmux-navigator'

  " Prettier
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    augroup prettier
      autocmd Filetype javascript,javascript.jsx nmap <silent> <leader>. :Prettier<cr>
    augroup END

  Plug 'scrooloose/nerdtree'
    map <leader>b :NERDTreeToggle<cr>
    map <leader>B :NERDTreeFind<cr>
    let NERDTreeQuitOnOpen = 1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeMinimalUI = 1

  Plug 'cloudhead/neovim-fuzzy'
    nnoremap <leader>f :FuzzyOpen<cr>

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><s-tab> pumvisible() ? "\<c-n>" : "\<s-tab>"

  Plug 'neomake/neomake'
    augroup localneomake
      autocmd! BufWritePost * Neomake
    augroup END

  Plug 'nathangrigg/vim-beancount'

  " Configure a nice credo setup, courtesy https://github.com/neomake/neomake/pull/300
  let g:neomake_elixir_enabled_makers = ['mycredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'      " Refactoring opportunities
      let l:type = 'W'
    elseif a:entry.type ==# 'D'  " Software design suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'W'  " Warnings
      let l:type = 'W'
    elseif a:entry.type ==# 'R'  " Readability suggestions
      let l:type = 'I'
    elseif a:entry.type ==# 'C'  " Convention violation
      let l:type = 'W'
    else
      let l:type = 'M'           " Everything else is a message
    endif
    let a:entry.type = l:type
  endfunction
  let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }

call plug#end()


" Searching
set showmatch incsearch hlsearch ignorecase smartcase
map <cr> :nohlsearch<cr>
map <space> :nohlsearch<cr>

" Shortcuts
map <leader>w :w<cr>
map <leader>q :q<cr>
nnoremap L $
nnoremap H _

" Window navigation
nnoremap <leader><leader> <c-^>

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
map <leader>v :e ~/.config/nvim/init.vim<cr>
map <leader>R :w \| :so ~/.config/nvim/init.vim \| :nohlsearch<cr>

augroup jtle
    autocmd!

    " Jump to last edit when opening file
    autocmd BufReadPost *
        \ if line("\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

augroup END

augroup tabs
  autocmd!

  autocmd Filetype php setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype sql setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

augroup misc
  autocmd!

  " Don't wrap CSV files
  au BufRead,BufNewFile *.csv set nowrap
augroup END

" ========= MASTERING VIM TIPS ==========
"
" Use :w!! (quickly) to save a file as sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" ==== COLOR CUSTOMIZATIONS

" Trailing whitespace
augroup TrailingWhitespace
  autocmd!
  autocmd ColorScheme *
        \ hi TrailingWhitespace ctermbg=red ctermfg=red guibg=#990000
  autocmd InsertLeave * match TrailingWhitespace /\s\+$/
  autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
  autocmd VimEnter,BufEnter,WinEnter * match TrailingWhitespace /\s\+$/
augroup END

" Characters after column 99
augroup OverLength
  autocmd!
  autocmd ColorScheme *
        \ hi OverLength ctermbg=red ctermfg=red guibg=#990000
  autocmd VimEnter,BufEnter,WinEnter * match OverLength /\%99v.\+/
augroup END

augroup SearchAndCommends
  autocmd ColorScheme * hi Search
        \ ctermfg=180 ctermbg=16 guifg=#e5c07b guibg=#282c384
        \ cterm=underline gui=underline |
        \ hi IncSearch
        \ ctermfg=180 ctermbg=16 guifg=#e5c07b guibg=#282c384
        \ cterm=underline gui=underline |
        \ hi Comment gui=italic cterm=italic
augroup END

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
