return {
  'numToStr/Navigator.nvim',
  config = true,
  keys = {
    { '<c-h>', '<cmd>NavigatorLeft<cr>', desc = 'Navigate Left' },
    { '<c-l>', '<cmd>NavigatorRight<cr>', desc = 'Navigate Right' },
    { '<c-k>', '<cmd>NavigatorUp<cr>', desc = 'Navigate Up' },
    { '<c-j>', '<cmd>NavigatorDown<cr>', desc = 'Navigate Down' },
    { '<c-\\>', '<cmd>NavigatorPrevious<cr>', desc = 'Navigate Previous' },
  }
}
