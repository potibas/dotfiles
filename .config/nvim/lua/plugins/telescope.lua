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
        mappings = {
          i = {
            -- Allow <c-j> and <c-k> for navigation
            ['<c-j>'] = 'move_selection_next',
            ['<c-k>'] = 'move_selection_previous',
            -- Change shortcuts for scrolling horizontally
            ['<c-h>'] = 'preview_scrolling_left',
            ['<c-l>'] = 'preview_scrolling_right',
            -- Disable normal mode
            ['<esc>'] = 'close',
          },
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
    { '<c-f>', function() require('telescope.builtin').live_grep() end,  desc = "Livegrep" },
    { '<c-s>', function() require('telescope.builtin').git_status() end, desc = "Git status picker" },
    {
      '<leader>gb',
      function() require('telescope.builtin').git_branches({ show_remote_tracking_branches = false }) end,
      desc = "Git branch picker"
    },
    {
      '<leader>gB',
      function() require('telescope.builtin').git_branches({ show_remote_tracking_branches = true }) end,
      desc = "Git branch picker"
    },
    { '<leader>gf', function() require('telescope.builtin').git_files() end,    desc = "Git file picker" },
    { '<leader>gl', function() require('telescope.builtin').git_commits() end,  desc = "Git log" },
    { '<leader>gL', function() require('telescope.builtin').git_bcommits() end, desc = "Git buffer log" },
  }
}
