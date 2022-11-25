local ok, cmp = pcall(require, "cmp")
if not ok then return end

-- https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local source_names = {
  nvim_lsp = "[LSP]",
  nvim_lua = "[NvimLua]",
  luasnip = "[Snippet]",
  buffer = "[Buffer]",
  path = "[Path]",
}

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  completion = {
    completeopt = "menu,menunone,noinsert",
  },
  enabled = function()
    -- don't use cmp in prompt windows (e.g.: telescope)
    buftype = vim.api.nvim_buf_get_option(0, "buftype")
    if buftype == "prompt" then return false end

    return true
  end,
  mapping = {
    ["<c-p>"] = cmp.mapping.select_prev_item(),
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<c-b>"] = cmp.mapping.scroll_docs(-1),
    ["<c-f>"] = cmp.mapping.scroll_docs(1),
    ["<c-e>"] = cmp.mapping.close(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
    ["<c-space>"] = cmp.mapping.complete(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
    { name = "path" },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = source_names[entry.source.name]
      return vim_item
    end,
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  window = {
    documentation = cmp.config.window.bordered(),
  },
}
