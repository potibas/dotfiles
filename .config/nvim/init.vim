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

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'slashmili/alchemist.vim'
    let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

  " Seamless window navigation between vim & tmux
  Plug 'christoomey/vim-tmux-navigator'

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

" Appearance
syntax on
set background=dark
set termguicolors
color neodark
set scrolloff=4
set cursorline
highlight Comment gui=italic cterm=italic

" Searching
set showmatch incsearch hlsearch ignorecase smartcase
map <cr> :nohlsearch<cr>
map <space> :nohlsearch<cr>
hi Search cterm=underline ctermfg=Yellow ctermbg=Black
hi IncSearch cterm=underline ctermfg=Yellow ctermbg=Black

" Show characters after column 80 in red
hi OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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
