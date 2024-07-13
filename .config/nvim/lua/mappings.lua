local map = vim.keymap.set

-- Basic operations
map('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
