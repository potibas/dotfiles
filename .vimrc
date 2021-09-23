set nocompatible

" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-scriptease'

call plug#end()

" Behaviour
let mapleader=','
set hidden

" Quick edit/reload vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC \| echo "Vim configuration reloaded"<cr>
