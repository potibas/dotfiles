local map = vim.keymap.set

-- Basic operations
map('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
map('n', '<leader>q', ':q<cr>', { silent = true, desc = 'Quit the current window' })
map('n', '<leader>e', ':e!<cr>', { silent = true, desc = 'Discard unsaved changes in current buffer' })

-- Home/End with H/L
map('n', 'H', '_', { silent = true, desc = 'Move to the start of the line' })
map('n', 'L', '$', { silent = true, desc = 'Move to the end of the line' })
