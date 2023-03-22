-- Expand current file's directory

vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>")
