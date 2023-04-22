-- Basic operations
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true, desc = 'Quit the current window' })
vim.keymap.set('n', '<leader>Q', ':qa<cr>', { silent = true, desc = 'Quit all windows' })
vim.keymap.set('n', '<leader>d', ':bd<cr>', { silent = true, desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>D', ':bd!<cr>', { silent = true, desc = 'Force delete buffer' })

-- Move between buffers
vim.keymap.set('n', '<leader>l', ':bnext<cr>', { silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<leader>h', ':bprevious<cr>', { silent = true, desc = 'Previous buffer' })

-- Expand current file's directory
vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>", { desc = "Current file's directory" })

-- Expand nvim config dir
vim.keymap.set('c', '##', "~/.config/nvim/lua/", { desc = "Neovim's config dir" })

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = 'Edit the alternate file' })

-- Make j/k movement more natural when text is wrapped
vim.keymap.set('n', 'j', 'gj', { desc = 'Down motion' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Up motion' })

-- Clear search highlight
vim.keymap.set('n', '<cr>', ':nohlsearch<cr>', { silent = true, desc = 'Clear the search highlight' })

-- Search history with C-P/C-N
local wildmenumap = function(mapping, alternate)
  return function()
    if vim.fn['wildmenumode']() == 1 then
      return mapping
    else
      return alternate
    end
  end
end
vim.keymap.set('c', '<c-p>', wildmenumap('<c-p>', '<up>'), { expr = true })
vim.keymap.set('c', '<c-n>', wildmenumap('<c-n>', '<down>'), { expr = true })
