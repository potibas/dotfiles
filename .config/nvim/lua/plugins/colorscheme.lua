return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  config = function()
    api = require('onedarkpro')
    api.setup({
      highlights = {
        -- Bring attention to errors in the git commit message
        ['@gitcommit_error.gitcommit'] = { reverse = true },
      },
    })

    vim.cmd([[colorscheme onedark_vivid]])
  end
}
