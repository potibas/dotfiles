return {
  'olimorris/onedarkpro.nvim',
  lazy = false,
  config = function()
    local api = require('onedarkpro')

    --[====[
   local helpers = require('onedarkpro.helpers')
   local colors = helpers.get_preloaded_colors()

   print(colors)
   --]====]

    api.setup({
      highlights = {
        -- Bring attention to errors in the git commit message
        ['@gitcommit_error.gitcommit'] = { reverse = true },

        -- Search
        Search = { fg = 'yellow', bold = true, italic = true, underline = true },
        CurSearch = { fg = 'white', bold = true, italic = true, underline = true, reverse = true },
        IncSearch = { link = 'Search' },

      },
    })

    vim.cmd([[colorscheme onedark_vivid]])
  end
}
