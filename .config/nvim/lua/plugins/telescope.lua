return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          center = { width = 0.8 },
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true
        }
      }
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
  end,
  keys = {
    { '<c-p>', function() require('telescope.builtin').find_files() end, desc = "Find Files" },
    { '<c-f><c-b>', function() require('telescope.builtin').buffers() end, desc = "Find Buffers" },
    { '<c-f><c-g>', function() require('telescope.builtin').live_grep() end, desc = "Livegrep" },
  }
}
