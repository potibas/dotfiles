local map = vim.keymap.set

-- Basic operations
map('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
map('n', '<leader>q', ':q<cr>', { silent = true, desc = 'Quit the current window' })
