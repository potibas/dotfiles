return {
  'tpope/vim-fugitive',
  lazy = false,
  keys = {
    { '<c-g>s', ':vertical Git<cr>',      silent = true, desc = 'Opens the git status window' },
    { '<c-g>d', ':Git diff --cached<cr>', silent = true, desc = 'Opens the diff for the staging area' },
  }
}
