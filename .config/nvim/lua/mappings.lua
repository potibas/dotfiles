-- Expand current file's directory
vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>")

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- Make j/k movement more natural when text is wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
