return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>tt', ':w | :TestNearest<cr>', desc = 'Test nearest' },
    { '<leader>tl', ':w | :TestLast<cr>',    desc = 'Test last' },
    { '<leader>tf', ':w | :TestFile<cr>',    desc = 'Test file' },
    { '<leader>ta', ':w | :TestSuite<cr>',   desc = 'Test suite' },
    { '<leader>tv', ':w | :TestVisit<cr>',   desc = 'Test visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
    vim.g['test#no_alternate'] = 1
  end
}
