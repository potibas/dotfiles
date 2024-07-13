local map = vim.keymap.set

-- Basic operations
map('n', '<leader>w', ':w<cr>', { silent = true, desc = 'Write buffer' })
map('n', '<leader>q', ':q<cr>', { silent = true, desc = 'Quit the current window' })
map('n', '<leader>e', ':e!<cr>', { silent = true, desc = 'Discard unsaved changes in current buffer' })

-- Navigate panes
map('n', '<c-h>', '<c-w>h');
map('n', '<c-j>', '<c-w>j');
map('n', '<c-k>', '<c-w>k');
map('n', '<c-l>', '<c-w>l');

-- Home/End with H/L
map('n', 'H', '_', { silent = true, desc = 'Move to the start of the line' })
map('n', 'L', '$', { silent = true, desc = 'Move to the end of the line' })

-- Expand the current file's directory
map('c', '%%', "<c-r>=expand('%:h').'/'<cr>", { desc = "Current file's directory" })

-- Switch to alternate file
map('n', '<leader><leader>', '<c-^>', { desc = 'Edit the alternate file' })

-- Clear search highlight
map('n', '<c-n>', ':nohlsearch<cr>', { silent = true, desc = 'Clear the search highlight' })

-- Search command history with ctrl+p & ctrl+n (use same behaviour as arrow keys)
local wildmenumap = function(mapping, alternate)
  return function()
    if vim.fn.wildmenumode() == 1 then
      return mapping
    else
      return alternate
    end
  end
end
map('c', '<c-p>', wildmenumap('<c-p>', '<up>'), { expr = true })
map('c', '<c-n>', wildmenumap('<c-n>', '<down>'), { expr = true })

-- Contextual help
map('n', '<c-_>', ':H <c-r><c-w><cr>', { silent = true, desc = 'Show help for the word under the cursor' })
map('n', '<c-/>', ':H <c-r><c-w><cr>', { silent = true, desc = 'Show help for the word under the cursor' })
