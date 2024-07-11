local builtin = function()
  return require('telescope.builtin')
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    local telescope = require('telescope')

    telescope.setup {
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

    telescope.load_extension('fzf')
    telescope.load_extension('file_browser')
  end,
  keys = {
    { '<c-p>',      function() builtin().find_files({ hidden = true }) end,                           desc = "Find Files" },
    { '<c-f>',      function() builtin().live_grep() end,                                             desc = "Livegrep" },
    { '<leader>pp', function() builtin().find_files({ no_ignore = true }) end,                        desc = "Find Files (all files)" },
    { '<leader>pf', function() builtin().live_grep({ additional_args = { '--no-ignore' } }) end,      desc = "Livegrep (all files)" },
    { '<c-s>',      function() builtin().git_status() end,                                            desc = "Git status picker" },
    { '<leader>gb', function() builtin().git_branches({ show_remote_tracking_branches = false }) end, desc = "Git branch picker" },
    { '<leader>gB', function() builtin().git_branches({ show_remote_tracking_branches = true }) end,  desc = "Git branch picker (w/ remotes)" },
    { '<leader>gf', function() builtin().git_files() end,                                             desc = "Git file picker" },
    { '<leader>gl', function() builtin().git_commits() end,                                           desc = "Git log" },
    { '<leader>gL', function() builtin().git_bcommits() end,                                          desc = "Git buffer log" },
  }
}
