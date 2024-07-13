return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()

    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            -- Disable normal mode
            ['<esc>'] = 'close',
            -- Allow <c-j> and <c-k> for navigation
            ['<c-j>'] = 'move_selection_next',
            ['<c-k>'] = 'move_selection_previous',
            -- Cycle through search history
            ['<c-p>'] = actions.cycle_history_prev,
            ['<c-n>'] = actions.cycle_history_next,
          },
        },
        history = {
          limit = 10000,
        }
      },
    }

  end,

  keys = {
    {
      '<c-p>',
      function() require('telescope.builtin').find_files({ hidden = true }) end,
      desc = 'Find Files',
    },
    {
      '<c-f>',
      function() require('telescope.builtin').live_grep() end,
      desc = 'Live Grep',
    }
  },

}
