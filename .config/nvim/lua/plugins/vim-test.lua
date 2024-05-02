return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { '<leader>tn', ':w | :TestNearest<cr>', silent = true, desc = 'Test nearest' },
    { '<leader>tl', ':w | :TestLast<cr>',    silent = true, desc = 'Test last' },
    { '\\',         ':w | :TestNearest<cr>', silent = true, desc = 'Test nearest' },
    { ' ',          ':w | :TestLast<cr>',    silent = true, desc = 'Test last' },
    { '<leader>tf', ':w | :TestFile<cr>',    silent = true, desc = 'Test file' },
    { '<leader>ta', ':w | :TestSuite<cr>',   silent = true, desc = 'Test suite' },
    { '<leader>tv', ':w | :TestVisit<cr>',   silent = true, desc = 'Test visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
    vim.g['test#no_alternate'] = 1

    -- PHP laravel
    vim.g['test#php#phpunit#executable'] = 'clear && php artisan test'

    vim.cmd([[
      function! RemoveExtraColorArg(cmd) abort
        return substitute(a:cmd, " --colors", "", "")
      endfunction

      let g:test#custom_transformations = {'php#phpunit': function('RemoveExtraColorArg')}
      let g:test#transformation = 'php#phpunit'
    ]])
  end,
}
