return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = {
        ['<c-c>'] = cmp.mapping.abort(),
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-u>'] = cmp.mapping.scroll_docs(4),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
        ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
      })
    })
  end,
}
