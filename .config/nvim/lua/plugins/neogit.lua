return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
  },

  config = true,

  -- keys = {
  --   {
  --     '<c-g>c',
  --     function() require('neogit').open({ 'commit', kind = 'vsplit' }) end,
  --     esc = 'Git commit',
  --   },
  --   {
  --     '<c-g>s',
  --     function() require('neogit').open({ kind = 'vsplit' }) end,
  --     desc = 'Git status',
  --   }
  -- },
}
