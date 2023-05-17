return {
  'numToStr/Navigator.nvim',
  config = true,
  keys = {
    { '<c-w>h', '<cmd>NavigatorLeft<cr>',  desc = 'Focus pane on the left' },
    { '<c-w>j', '<cmd>NavigatorDown<cr>',  desc = 'Focus pane below' },
    { '<c-w>k', '<cmd>NavigatorUp<cr>',    desc = 'Focus pane above' },
    { '<c-w>l', '<cmd>NavigatorRight<cr>', desc = 'Focus pane on the right' },
  }
}
