-- Basic operations
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true })
vim.keymap.set('n', '<leader>d', ':bd<cr>', { silent = true })
vim.keymap.set('n', '<leader>D', ':bd!<cr>', { silent = true })

-- Expand current file's directory
vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>")

-- Expand nvim config dir
vim.keymap.set('c', '##', "~/.config/nvim/lua/")

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- Make j/k movement more natural when text is wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- Clear search highlight with <cr>
vim.keymap.set('n', '<cr>', ':nohlsearch<cr>', { silent = true })

-- Search history with C-P/C-N
local wildmenumap = function (mapping, alternate)
  return function ()
    if vim.fn['wildmenumode']() == 1 then
      return mapping
    else
      return alternate
    end
  end
end
vim.keymap.set('c', '<c-p>', wildmenumap('<c-p>', '<up>'), { expr = true })
vim.keymap.set('c', '<c-n>', wildmenumap('<c-n>', '<down>'), { expr = true })
