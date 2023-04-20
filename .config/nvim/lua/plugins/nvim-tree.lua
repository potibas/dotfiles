return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  keys = {
    { '<c-b>', ':NvimTreeFindFileToggle<CR>', desc = "Open File Tree" },
  },
  config = function()
    require('nvim-tree').setup {
      diagnostics = {
        enable = true,
      },
      filters = {
        custom = {
          "^\\.git",
        }
      },
      view = {
        width = 45,
        side = 'left'
      },
      actions = {
        change_dir = {
          enable = false,
          global = false,
        },
      }
    }

    vim.cmd [[hi! NvimTreeNormalNC guibg=none ctermbg=none ]]
    vim.cmd [[hi! NvimTreeNormal guibg=none ctermbg=none ]]
    vim.cmd [[hi! NvimTreeWinSeparator guibg=none ctermbg=none ]]
  end
}
