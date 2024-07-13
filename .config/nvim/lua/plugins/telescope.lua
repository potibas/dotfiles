return {
  'nvim-telescope/telescope.nvim',

  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'BurntSushi/ripgrep',
  },

  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
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
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          },
        },
      },
    })

    telescope.load_extension('fzf')
  end,

  keys = {
    {
      '<c-p>',
      function() require('telescope.builtin').find_files({ hidden = true }) end,
      desc = 'Find Files',
    },
    {
      '<c-f><c-p>',
      function() require('telescope.builtin').live_grep() end,
      desc = 'Find Files (all files)',
    },
    {
      '<c-f><c-f>',
      function() require('telescope.builtin').live_grep() end,
      desc = 'Live Grep',
    },
    {
      '<c-f><c-a>',
      function() require('telescope.builtin').live_grep({ additional_args = { '--no-ignore' } }) end,
      desc = 'Live Grep (all files)',
    },
    {
      '<c-g><c-s>',
      function() require('telescope.builtin').git_status() end,
      desc = 'Git Status',
    },
  },

}
