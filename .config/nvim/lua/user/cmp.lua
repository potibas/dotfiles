local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

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
    return not luasnip.in_snippet() or not luasnip.jumpable(1)
  end,
  mapping = {
    ["<c-p>"] = cmp.mapping.select_prev_item(),
    ["<c-n>"] = cmp.mapping.select_next_item(),
    ["<c-b>"] = cmp.mapping.scroll_docs(-1),
    ["<c-f>"] = cmp.mapping.scroll_docs(1),
    ["<tab>"] = function(fallback)
      if luasnip.in_snippet() and luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif cmp.visible() then
        cmp.confirm()
      else
        fallback()
      end
    end,
    ["<s-tab>"] = function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
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
  window = {
    documentation = cmp.config.window.bordered(),
  },
}
