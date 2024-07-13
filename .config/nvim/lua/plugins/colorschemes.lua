return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  config = function()

    local api = require('onedarkpro')

    api.setup({
      highlights = {
        -- Search
        Search = { fg = 'yellow', bold = false, italic = true, underline = true },
        CurSearch = { fg = 'white', bold = true, italic = true, underline = true },
        IncSearch = { link = 'Search' },
      },
    })

    vim.cmd([[colorscheme onedark_vivid]])

  end
}
