return {
  'nvim-treesitter/nvim-treesitter',

  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter.configs').setup({

      ensure_installed = 'all',

      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },

      highlight = {
        enable = true,

        -- Disable highlight for huge files
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 50000
        end,

        -- Use vim regex highlight inside documentation blocks or
        -- other regions that use markdown syntax.
        additional_vim_regex_highlighting = { "markdown" },
      },

    })
  end,
}
