return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-path',
  },
  config = function()
    vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'

    local cmp = require('cmp')

    cmp.setup {
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          local lspkind_icons = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = ' ',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '硫',
            Property = '',
            Unit = ' ',
            Value = '',
            Enum = ' ',
            Keyword = 'ﱃ',
            Snippet = ' ',
            Color = ' ',
            File = ' ',
            Reference = 'Ꮢ',
            Folder = ' ',
            EnumMember = ' ',
            Constant = ' ',
            Struct = ' ',
            Event = '',
            Operator = '',
            TypeParameter = ' ',
            Copilot = "",
          }

          local meta_type = vim_item.kind

          vim_item.kind = lspkind_icons[vim_item.kind] .. ''

          vim_item.menu = ({
                buffer = ' Buffer',
                nvim_lsp = meta_type,
                path = ' Path',
                luasnip = ' LuaSnip',
              })[entry.source.name]

          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
            ['<c-c>'] = cmp.mapping.abort(),
            ['<c-d>'] = cmp.mapping.scroll_docs(-4),
            ['<c-u>'] = cmp.mapping.scroll_docs(4),
            ['<c-l>'] = cmp.mapping.confirm({ select = true }),
            ['<cr>'] = cmp.mapping.confirm({ select = false }),
            ['<c-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i' }),
            ['<c-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i' }),
      },
      sources = {
        { name = 'vsnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          }
        },
      }
    }

    local opts = { remap = true, expr = true, replace_keycodes = false }
    vim.keymap.set({ 'i', 's' }, '<c-l>', "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<c-l>'", opts)
    vim.keymap.set({ 'i', 's' }, '<c-h>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-h>'", opts)
  end
}
