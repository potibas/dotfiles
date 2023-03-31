return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>t', ':w | :TestNearest<cr>', desc = 'Test nearest' },
    {
      '<c-t>',
      function ()
        local filename = vim.fn['expand']('%')
        if vim.fn['test#test_file'](filename) then
          vim.cmd(':w | :TestNearest')
        else
          vim.cmd(':w | :TestLast')
        end
      end,
      desc = 'Test nearest or last'
    },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
    vim.g['test#no_alternate'] = 1
  end
}
