" The basics
set nocompatible
set nobackup nowritebackup noswapfile

" vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.local/share/nvim/site/autoload')

" Essentials
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-projectionist'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'KeitaNakamura/neodark.vim'
Plug 'rakr/vim-one'
Plug 'nanotech/jellybeans.vim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap <silent> <C-P> <cmd>Telescope find_files<cr>
nnoremap <silent> <F3> <cmd>Telescope live_grep<cr>

" Bells and whistles
Plug 'mhinz/vim-signify'
Plug 'kyazdani42/nvim-web-devicons'

" Octo ?
" Plug 'pwntester/octo.nvim'

" Language support
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'tpope/vim-endwise'

" Language server
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

call plug#end()

" Appearance
syntax on
set scrolloff=5
set number relativenumber cursorline noshowmode
set showcmd cmdheight=1 laststatus=2

if (has("termguicolors"))
  set termguicolors
endif

let g:gruvbox_italic = 1
let g:neodark#italics = 1
let g:one_allow_italics = 1
set background=dark
color one

" Behaviour
set matchtime=1

" Shortcuts
let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>b :Buffers<cr>
inoremap <silent> <C-s> <C-O>:update<cr>
nnoremap <silent> <C-s> :update<cr>

" Splits
set splitright
set fillchars+=vert:│
" set fillchars+=stl:―
" set fillchars+=stlnc:―
highlight VertSplit ctermfg=16 ctermbg=bg guifg=white guibg=guibg

" FZF
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <F3> :Rg<cr>

" Not sure
set autowrite

" Indentation
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab autoindent smartindent

" Searching
set showmatch incsearch hlsearch ignorecase
set smartcase " case sensitive if at least one uppercase
nnoremap <silent> <leader>/ :set hls!<cr>
nnoremap <silent> <leader>\ :let @/=""<cr>
highlight Search ctermbg=bg ctermfg=fg term=underline guibg=guibg guifg=guifg gui=underline
highlight IncSearch ctermbg=bg ctermfg=fg term=underline guibg=guibg guifg=#ff6865 gui=underline,italic

" Search history with C-P/C-N
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

" No beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Vim-signify
set signcolumn=yes
set updatetime=50
nnoremap <leader>u :SignifyHunkUndo<cr>

" Eh, mouse
set mouse=a

" Faster faster
set timeoutlen=400
set ttimeoutlen=0
set ttyfast

" Indent if we're at the beginning of a line. Else, do completion.
" Ref: https://github.com/garybernhardt/dotfiles/blob/main/.vimrc
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    endif

    let char = getline('.')[col - 1]
    if char =~ '\k'
        " There's an identifier before the cursor, so complete the identifier.
        return "\<c-p>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Elixir
let g:mix_format_on_save = 1
" find some better collors
:call one#highlight('elixirCharList', '6a8854', '', 'none')
