-- Basic operations
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
vim.keymap.set('n', '<leader>W', ':wq<cr>', { silent = true, desc = 'Write buffer and quit current window' })
vim.keymap.set('n', '<leader>x', '<esc>:bprevious<bar>bdelete #<return>', { silent = true, desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>X', ':%bd!|e#<cr>', { silent = true, desc = 'Delete other buffers' })
vim.keymap.set('n', '<leader>e', ':e!<cr>', { silent = true, desc = 'Reload current file' })

-- Stop being annoyed by the `q` key
vim.keymap.set('c', 'q:', '<Nop>', { silent = true })
vim.keymap.set('n', 'q', ':close<cr>', { silent = true, desc = 'Close current window' })
vim.keymap.set('n', 'Q', ':qa<cr>', { silent = true, desc = 'Quit all windows' })

-- Home/End with HL
vim.keymap.set('n', 'H', '_', { silent = true, desc = 'Move to the start of the line' })
vim.keymap.set('n', 'L', '$', { silent = true, desc = 'Move to the end of the line' })

-- Navigate panes
vim.keymap.set('n', '<c-h>', '<c-w>h');
vim.keymap.set('n', '<c-j>', '<c-w>j');
vim.keymap.set('n', '<c-k>', '<c-w>k');
vim.keymap.set('n', '<c-l>', '<c-w>l');

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = 'Edit the alternate file' })

-- Expand current file's directory
vim.keymap.set('c', '%%', "<C-R>=expand('%:h').'/'<cr>", { desc = "Current file's directory" })
vim.keymap.set('c', '##', '~/.config/nvim/lua/', { desc = "Neovim's config dir" })

-- Make j/k movement more natural when text is wrapped
vim.keymap.set('n', 'j', 'gj', { desc = 'Down motion' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Up motion' })

-- Toggle line wrapping<D-s>
vim.keymap.set('n', '<F2>', ':set nowrap!<cr>', { silent = true, desc = 'Toggle line wrapping' })

-- Clear search highlight
vim.keymap.set('n', '<c-n>', ':nohlsearch<cr>', { silent = true, desc = 'Clear the search highlight' })

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

-- ctrl+/ for contextual help
vim.keymap.set('n', '<c-/>', ':H <c-r><c-w><cr>', { silent = true, desc = 'Show help for the word under the cursor' })
vim.keymap.set('n', '<c-_>', ':H <c-r><c-w><cr>', { silent = true, desc = 'Show help for the word under the cursor' })
