local custom_highlights = {
  -- Bring attention to errors in the git commit message
  ['@gitcommit_error.gitcommit'] = { reverse = true },

  -- Search
  Search = { fg = 'yellow', bold = false, italic = true, underline = true },
  CurSearch = { fg = 'white', bold = true, italic = true, underline = true },
  IncSearch = { link = 'Search' },
}

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        dim_inactive = {
          enabled = true,
          shade = 'dark',
          percentage = 0.25,
        },
        custom_highlights = custom_highlights,
        highlights = custom_highlights,
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    lazy = true,
    config = function()
      local api = require('onedarkpro')

      api.setup({
        highlights = custom_highlights,
      })
    end
  },
}
