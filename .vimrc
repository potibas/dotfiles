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
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale'

" Language Support
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}

" Nice to haves
Plug 'mhinz/vim-signify'
Plug 'vim-test/vim-test'

" Eccentricities
Plug 'itchyny/lightline.vim'

" Colorschemes
Plug 'Lokaltog/vim-distinguished'
Plug 'KeitaNakamura/neodark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'

call plug#end()

" Appearance
syntax on

set scrolloff=5
set number relativenumber cursorline noshowmode
set showcmd cmdheight=1 laststatus=2
set background=dark t_Co=256
set fillchars-=vert:\|
set fillchars+=vert:│
set signcolumn=yes
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'helloworld' ] ]
      \ },
      \ 'component': {
      \   'helloworld': '💩'
      \ },
      \ }


let g:signify_sign_add='→'
let g:signify_sign_change='❗️'
let g:signify_sign_delete='❌'
let g:signify_sign_delete_first_line='❌'
let g:signify_sign_change_delete='❗️❌'

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

nnoremap ,l :call LightlineReload()<cr>

let g:gruvbox_italic=1
silent! color gruvbox

" Elixir
let g:ale_linters = {
      \ 'elixir': ['credo', 'dialyzer']
      \ }
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:mix_format_on_save = 1

" No beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Eh, mouse
set ttymouse=xterm2
set mouse=a

" Faster faster
set noesckeys
set timeoutlen=400
set ttimeoutlen=0
set ttyfast

set autowrite
set backspace=indent,eol,start

" Configures vim-signify nicely
set updatetime=50

" Shortcuts
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>b :Buffers<cr>

" Toggle paste mode with F2
nnoremap <silent> <F2> :set paste!<cr>

" Toggle wrap with F6
nnoremap <silent> <F6> :set wrap!<cr>

" Undo the current hunk
nnoremap <leader>u :SignifyHunkUndo<cr>

" Undo with <ctrl+u>
nnoremap <c-f>z u
inoremap <C-f>z <esc>u

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" Save file: ctrl+s
inoremap <silent> <C-s> <C-O>:update<cr>
nnoremap <silent> <C-s> :update<cr>

" Window navigation and resizing
set splitright
nnoremap vv <C-w>v
nnoremap vh <C-w>s
nnoremap <silent> vq :q<cr>

" Pane resizing
nnoremap <C-f>h <C-w>5<
nnoremap <C-f>j <C-w>-
nnoremap <C-f>k <C-w>+
nnoremap <C-f>l <C-w>5>

" Fast switch to the last edited file with ,,
nnoremap <leader><leader> <c-^>

" Indentation
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab autoindent smartindent

" Searching
set showmatch incsearch hlsearch ignorecase
set smartcase " case sensitive if at least one uppercase
nmap <space> :nohlsearch<cr>

" highlight white space
set list
set listchars=""
set listchars+=tab:>\ 
set listchars+=trail:•
set listchars+=extends:#
set listchars+=nbsp:•

" FZF
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <F3> :Rg<cr>

" Current file's directory with %%
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Search history with C-P/C-N
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

" Quick edit vim configuration:
map <leader>v :e ~/.vimrc<cr>
map <leader>V :e ~/.gvimrc<cr>
map <leader>R :w \| :so %<cr>

" Jump around quickfix window
set <S-F4>=[1;2S
nnoremap <silent> <F4> :cnext<cr>
nnoremap <silent> <S-F4> :cprev<cr>

augroup vimrc
    autocmd!

    " Jump to last edit when opening file
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

augroup END

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

" Test with dispatch
let test#strategy = "dispatch"

" vim-projectionist
let g:projectionist_heuristics = {
       \ 'mix.exs': {
         \ 'lib/*.ex': {
           \ 'type': 'lib',
           \ 'alternate':  'test/{}_test.exs',
           \ 'template': ['defmodule {camelcase|capitalize|dot} do', '', 'end']
           \ },
         \ 'test/*_test.exs': {
           \ 'type': 'test',
           \ 'alternate': 'lib/{}.ex',
           \ 'template': [
             \ 'defmodule {camelcase|capitalize|dot}Test do',
             \ '  use ExUnit.Case',
             \ '',
             \ '  alias {camelcase|capitalize|dot}',
             \ 'end'
           \ ]}
         \}
       \}

nnoremap <silent> K :call <SID>show_documentation()<CR>
