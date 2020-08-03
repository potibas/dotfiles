" The basics
set nocompatible
set nobackup nowritebackup noswapfile

" No beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Shortcuts
let mapleader = ","

" Fast switch to the last edited file with ,,
nnoremap <leader><leader> <c-^>

" Search history with C-P/C-N
cnoremap <expr> <C-P> wildmenumode() ? "\<C-P>" : "\<Up>"
cnoremap <expr> <C-N> wildmenumode() ? "\<C-N>" : "\<Down>"

" Quick edit vim configuration:
map <leader>v :e ~/.vimrc<cr>
map <leader>V :e ~/.gvimrc<cr>
map <leader>R :w \| :so %<cr>
