-- Expand current file's directory
vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>")

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>')
