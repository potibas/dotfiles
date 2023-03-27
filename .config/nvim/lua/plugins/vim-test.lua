return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>y', ':w | :TestNearest<CR>', desc = 'Test Nearest' },
    { '<leader>t', ':w | :TestLast<CR>', desc = 'Test Last' },
    { '<leader>T', ':w | :TestFile<CR>', desc = 'Test File' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 1
  end
}
