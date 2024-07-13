return {
  'kyazdani42/nvim-tree.lua',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  keys = {
    {
      '<c-b>',
      function()
        local api = require("nvim-tree.api")
        if api.tree.is_visible() and api.tree.winid() == vim.api.nvim_get_current_win() then
          vim.cmd('wincmd W')
        else
          api.tree.focus()
        end
      end,
      desc = "Open File Tree"
    }
  },
  config = function()
    require('nvim-tree').setup {
      diagnostics = {
        enable = true,
      },
      update_focused_file = {
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
