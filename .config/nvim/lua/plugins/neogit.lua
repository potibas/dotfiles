return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
  },

  config = function()
    local neogit = require('neogit')

    neogit.setup({
      kind = 'replace',
    })

    vim.api.nvim_create_user_command('G', 'Neogit', {})

    vim.keymap.set('n', '<c-g><c-g>', neogit.open, { desc = 'Git status', silent = true, noremap = true })
    vim.keymap.set('n', '<c-g><c-c>', ':Neogit commit<cr>', { desc = 'Git status', silent = true, noremap = true })
  end
}
