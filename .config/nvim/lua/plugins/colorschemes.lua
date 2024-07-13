local custom_highlights = function(colors)
  return {
    -- Bring attention to errors in the git commit message
    ['@gitcommit_error.gitcommit'] = { reverse = true },

    -- Search
    Search = { italic = true, underline = true, fg = colors.yellow, bg = 'NONE'  },
    CurSearch = { italic = true, underline = true, fg = colors.blue, bold = true, bg = 'NONE' },
    IncSearch = { link = 'Search' },
  }
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,

    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        custom_highlights = custom_highlights,
      })

      vim.cmd.colorscheme('catppuccin')
    end,
  },
  {
    'olimorris/onedarkpro.nvim',
    lazy = false,
    config = function()
      local api = require('onedarkpro')
      local colors = require('onedarkpro.helpers').get_preloaded_colors()

      api.setup({
        highlights = custom_highlights(colors),
      })
    end
  },
}
