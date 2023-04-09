return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'RRethy/nvim-treesitter-endwise',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = 'all',
      indent = {
        enable = true
      },
      endwise = {
        enable = true
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        -- Use vim regex highlight inside documentation blocks or
        -- other regions that use markdown syntax.
        additional_vim_regex_highlighting = { "markdown" },
      },
      autotag = {
        enable = true,
      },
    })
  end
}
