return {
  'numToStr/Navigator.nvim',
  config = true,
  keys = {
    { '<c-h>', '<cmd>NavigatorLeft<cr>',  desc = 'Focus pane on the left' },
    { '<c-j>', '<cmd>NavigatorDown<cr>',  desc = 'Focus pane below' },
    { '<c-k>', '<cmd>NavigatorUp<cr>',    desc = 'Focus pane above' },
    { '<c-l>', '<cmd>NavigatorRight<cr>', desc = 'Focus pane on the right' },
  }
}
