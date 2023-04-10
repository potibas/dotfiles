return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>tn', ':w | :TestNearest<cr>', silent = true, desc = 'Test nearest' },
    { '<leader>tl', ':w | :TestFile<cr>',    silent = true, desc = 'Test last' },
    { '<leader>tf', ':w | :TestFile<cr>',    silent = true, desc = 'Test file' },
    { '<leader>ta', ':w | :TestSuite<cr>',   silent = true, desc = 'Test suite' },
    { '<leader>tv', ':w | :TestVisit<cr>',   silent = true, desc = 'Test visit' },
    { '<cr>',       ':w | :TestLast<cr>',    silent = true, desc = 'Test last' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
    vim.g['test#no_alternate'] = 1
  end
}
