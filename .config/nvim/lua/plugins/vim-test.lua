return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>t', ':w | :TestNearest<cr>', desc = 'Test nearest' },
    { '<leader>Tf', ':w | :TestFile<cr>', desc = 'Test file' },
    { '<leader>Tl', ':w | :TestLast<cr>', desc = 'Test last' },
    { '<leader>Ta', ':w | :TestSuite<cr>', desc = 'Test suite' },
    { '<leader>Tv', ':w | :TestVisit<cr>', desc = 'Test visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
  end
}
