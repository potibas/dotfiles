-- Basic operations
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true, desc = 'Quit the current window' })
vim.keymap.set('n', '<leader>Q', ':qa<cr>', { silent = true, desc = 'Quit all windows' })
vim.keymap.set('n', '<leader>x', '<esc>:bprevious<bar>bdelete #<return>', { silent = true, desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>X', ':%bd!|e#<cr>', { silent = true, desc = 'Delete other buffers' })

-- Move between buffers
vim.keymap.set('n', '<leader>l', ':bnext<cr>', { silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<leader>h', ':bprevious<cr>', { silent = true, desc = 'Previous buffer' })

-- Navigate panes
vim.keymap.set('n', '<c-h>', '<c-w>h');
vim.keymap.set('n', '<c-j>', '<c-w>j');
vim.keymap.set('n', '<c-k>', '<c-w>k');
vim.keymap.set('n', '<c-l>', '<c-w>l');

-- Home/End with HL
vim.keymap.set('n', 'H', '_', { silent = true, desc = 'Move to the beginning of the line (first non-blank character)' })
vim.keymap.set('n', 'L', '$', { silent = true, desc = 'Move to the end of the line' })

-- Expand current file's directory
-- '%%' conflicts with % and show-key behaviour shomehow
vim.keymap.set('c', '#%', "<C-R>=expand('%:h').'/'<cr>", { desc = "Current file's directory" })

-- Expand nvim config dir
vim.keymap.set('c', '##', "~/.config/nvim/lua/", { desc = "Neovim's config dir" })

-- Switch to alternate file
vim.keymap.set('n', '<leader><leader>', '<c-^>', { desc = 'Edit the alternate file' })

-- Make j/k movement more natural when text is wrapped
vim.keymap.set('n', 'j', 'gj', { desc = 'Down motion' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Up motion' })

-- Toggle line wrapping
vim.keymap.set('n', '<F2>', ':set nowrap!<cr>', { silent = true, desc = 'Toggle line wrapping' })

-- Clear search highlight
vim.keymap.set('n', '<c-c>', ':nohlsearch<cr>', { silent = true, desc = 'Clear the search highlight' })

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

-- Avoid annoying ex mode window appearing
vim.keymap.set('c', 'q:', '<Nop>', { silent = true })

-- g? for contextual help
vim.keymap.set('n', 'g?', ':H <c-r><c-w><cr>', { silent = true, desc = 'Show help for the word under the cursor' })
