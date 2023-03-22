-- Expand current file's directory
vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>")

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>')

-- Make j/k movement more natural when text is wrapped
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

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
