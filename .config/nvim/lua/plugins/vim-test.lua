return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<c-t><c-y>', ':w | :TestNearest<CR>', desc = 'Test Nearest' },
    { '<c-t><c-t>', ':w | :TestLast<CR>', desc = 'Test Last' },
    { '<c-t><c-f>', ':w | :TestFile<CR>', desc = 'Test File' },
    { '<c-t><c-a>', ':w | :TestSuite<CR>', desc = 'Test Suite' },
    { '<c-t><c-v>', ':TestVisit<CR>', desc = 'Test Visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 1
  end
}
