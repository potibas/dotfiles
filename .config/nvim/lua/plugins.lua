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
      vim.cmd([[highlight IncSearch cterm=underline,italic guibg='NONE' guifg=#ffff00 gui=underline,italic]])
      vim.cmd([[highlight Search cterm=underline,italic guibg='NONE' guifg=#ffff00 gui=underline,italic]])
    end,
  },

  -- Essentials
  'tpope/vim-commentary',
  'tpope/vim-surround',

}
