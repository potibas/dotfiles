return {

  -- Colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      require('tokyonight').setup({
        style = 'moon',
        transparent = true,
        dim_inactive = true,
      })
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

}
