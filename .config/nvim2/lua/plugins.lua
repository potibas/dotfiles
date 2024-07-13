return {

  -- Essentials
  'tpope/vim-commentary',
  'tpope/vim-surround',

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    config = function()
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  },

  -- Which key
  { 'folke/which-key.nvim', config = true },

}
