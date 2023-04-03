return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>t', ':w | :TestLast<cr>', desc = 'Test last' },
    { '<space>tt', ':w | :TestNearest<cr>', desc = 'Test nearest' },
    { '<space>tf', ':w | :TestFile<cr>', desc = 'Test file' },
    { '<space>ta', ':w | :TestSuite<cr>', desc = 'Test suite' },
    { '<space>tv', ':w | :TestVisit<cr>', desc = 'Test visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
    vim.g['test#no_alternate'] = 1
  end
}
